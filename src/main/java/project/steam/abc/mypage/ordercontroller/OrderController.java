package project.steam.abc.mypage.ordercontroller;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import project.steam.abc.cart.service.CartService;
import project.steam.abc.mypage.orderdto.OrderDTO;
import project.steam.abc.mypage.orderdto.OrderPageDTO;
import project.steam.abc.mypage.orderdto.OrderSearchDTO;
import project.steam.abc.mypage.orderdto.PageMaker;
import project.steam.abc.mypage.orderservice.OrderService;
import project.steam.abc.product.dto.ProductDTO;
import project.steam.abc.product.service.ProductService;

@Controller
public class OrderController {
	
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@Autowired
	private OrderService orderService;
	@Autowired
	@Qualifier("productService")
	private ProductService productService;
	@Autowired
	@Qualifier("cartService")
	private CartService cartService;
	
	
	@RequestMapping(value = "/OrderSelectAll", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("searchDTO")OrderSearchDTO searchDTO) {
		
		model.addAttribute("list", orderService.ordListPage(searchDTO));
		model.addAttribute("ordListCount", orderService.ordListCount(searchDTO));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setOrderPageDTO(searchDTO);
		pageMaker.setTotalCount(orderService.ordListCount(searchDTO));
		
		model.addAttribute("pageMaker", pageMaker);
		
		logger.info("로그" + model, model);
		
		return "./order/order_select_all_view";
	}
	
	@RequestMapping(value = "/OrderSelectMy", method = RequestMethod.GET)
	public String myList(Model model, OrderPageDTO orderPageDTO) {
		
		model.addAttribute("myList", orderService.ordListPageMy(orderPageDTO));
		model.addAttribute("ordListCountMy", orderService.ordListCountMy(orderPageDTO));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setOrderPageDTO(orderPageDTO);
		pageMaker.setTotalCount(orderService.ordListCountMy(orderPageDTO));
		
		model.addAttribute("pageMaker", pageMaker);
		
		logger.info("로그" + model, model);
		
		return "./order/order_select_my_view";
	}
	
	@RequestMapping(value = "/OrderSelectDetail", method = RequestMethod.GET)
	public String ordSelectDetail(Model model, OrderDTO orderDTO) {
		
		model.addAttribute("orderDTO", orderService.ordSelectDetail(orderDTO.getOrdno()));
		return "./order/order_select_detail_view";
	}
	
	@RequestMapping(value = "/OrderInsert", method = RequestMethod.GET)
	public String ordInsert(Model model, OrderDTO orderDTO) {
		model.addAttribute("orderDTO", orderDTO);
		return "./order/order_insert";
	}
	
	@RequestMapping(value = "/OrderInsert", method = RequestMethod.POST)
	public String ordInsertPost(Model model, OrderDTO orderDTO) {

		List<OrderDTO> list = new ArrayList<OrderDTO>();
		List<OrderDTO> lists = new ArrayList<OrderDTO>();
		
				String arrPname =  orderDTO.getPname();
				String mName = orderDTO.getMname();
				String ordAddress = orderDTO.getOrdaddress();
				String ordSituation = orderDTO.getOrdsituation();

				int productQuantity = StringUtils.countMatches(arrPname, ",") + 1;

				String[] arrayProducts = arrPname.split(",");
				
				for (int i = 0; i < productQuantity; i++) {
					
					list.add(i, productService.productSelectAsOrder(arrayProducts[i]));
					
				}	
				
				for (int i = 0; i < list.size(); i++) {
					
					lists.addAll(i, cartService.cartCheckAsOrder(list.get(i))); 
					
				}

				for (int i = 0; i < lists.size(); i++) {
					
					orderDTO = lists.get(i);
					orderDTO.setMname(mName);
					orderDTO.setOrdaddress(ordAddress);
					orderDTO.setOrdsituation(ordSituation);
					
					orderService.ordInsertAsLists(orderDTO);
					
				}
				
	
				return "./order/order_insert_view";
	}
	
	@RequestMapping(value = "/OrderInsertAsCart", method = RequestMethod.POST)
	public String ordInsertAsCart(Model model, OrderDTO orderDTO, ProductDTO productDTO) {

		String mid = productDTO.getMid();
		
		System.err.println(mid);
		System.err.println(mid);
		System.err.println(mid);
		System.err.println(mid);
		System.err.println(mid);
		
		productService.productUpdateSetMid(productDTO);
		
		List<Object> list = new ArrayList<Object>();
		List<Object> lists = new ArrayList<Object>();
		
		String products = orderDTO.getPname();

		int productQuantity = StringUtils.countMatches(products, ",") + 1;

		String[] arrayProducts = products.split(",");
		
		for (int i = 0; i < productQuantity; i++) {
		
			list.add(i, productService.productSelect(arrayProducts[i]));
			
		}	
		
		for (int i = 0; i < list.size(); i++) {
			
			lists.add(i, cartService.cartCheck(list.get(i))); 
			
		}
		
		for (int i = 0; i < lists.size(); i++) {

			System.err.println(lists.get(i));
			
		}
		
		model.addAttribute("lists", lists);

		
		return "./cart/cart_insert";
	}
	
	@RequestMapping(value = "/OrderUpdate", method = RequestMethod.GET)
	public String ordUpdate(Model model, OrderDTO orderDTO) {
		model.addAttribute("orderDTO", orderService.ordSelectDetail(orderDTO.getOrdno()));
		return "./order/order_update";
	}
	
	@RequestMapping(value = "OrderUpdate", method = RequestMethod.POST)
	public String ordUpdate(OrderDTO orderDTO) {
		orderService.ordUpdate(orderDTO);
		return "./order/order_update_view";
	}
	
	@RequestMapping(value = "/OrderDelete", method = RequestMethod.GET)
	public String ordDelete(Model model, OrderDTO orderDTO, @RequestParam("ordstate") String ordstate) {
		orderDTO = orderService.ordSelectDetail(orderDTO.getOrdno());
		model.addAttribute("orderDTO", orderDTO);
		model.addAttribute("ordstate", ordstate);
		
		return "./order/order_delete";
	}
	
	@RequestMapping(value = "/OrderDeleteView", method = RequestMethod.GET)
	public String ordDeleteView(Model model, OrderDTO orderDTO, @RequestParam("ordstate") String ordstate) {
		model.addAttribute("orderDTO", orderDTO);
		model.addAttribute("ordstate", ordstate);
		orderService.ordDelete(orderDTO.getOrdno());
		
		return "./order/order_delete_view";
	}
	
	@RequestMapping(value = "/OrderConfirm", method = RequestMethod.GET)
	public String aplConfirm(Model model, ProductDTO productDTO) {
		
		model.addAttribute("productDTO", productDTO);
		return "./order/order_confirm";
	}
	
	@RequestMapping(value = "/OrderConfirm2", method = RequestMethod.GET)
	public String ordConfirm2(Model model, OrderDTO orderDTO) {
		
		model.addAttribute("orderDTO", orderDTO);
		return "./order/order_confirm2";
	}
	
}
