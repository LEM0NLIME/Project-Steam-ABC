package project.steam.abc.cart.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import project.steam.abc.cart.dto.CartCalculateDTO;
import project.steam.abc.cart.dto.CartDTO;
import project.steam.abc.cart.service.CartService;
import project.steam.abc.member.dto.MemberDTO;

@Controller
public class CartController {
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);
	
	@Autowired
	private CartService cartService;
	
	//장바구니 등록
	@RequestMapping(value = "/CartInsert", method = RequestMethod.POST)
	@ResponseBody
	public String CartInsert(CartDTO cartDTO, MemberDTO memberDTO) {

		
		if (memberDTO.getMid() == "") {

			return "5";
		}

		
		String result = Integer.toString(cartService.cartInsert(cartDTO));
		logger.info("카트 DTO 확인" , cartDTO);
		return result;
	}

	//장바구니 상세보기
	@RequestMapping(value = "/CartSelectDetail", method = RequestMethod.GET)
	public String CartSelectDetail(Model model, @RequestParam("mid") String mid, HttpServletRequest request, HttpSession session) {

		List<CartDTO> list = cartService.cartSelect(mid);

		List<CartDTO> list2 = cartService.cartSelectAll();
		String size = "0";

		model.addAttribute("mid", mid);

		if (list.size() < 1) {

			model.addAttribute("size", size);

		}
		
		model.addAttribute("cartlist", list);
		
		model.addAttribute("cartlistall" , list2);
		
		return "./cart/cart_select";
	}

	@RequestMapping(value = "/CartSelectDetail", method = RequestMethod.POST)
	public String CartDelete(HttpServletRequest httpServletRequest) {

		String[] ajaxMsg = httpServletRequest.getParameterValues("valueArr");
		
		int size = ajaxMsg.length;
		
		for (int i = 0; i < size; i++) {
			cartService.cartDelete(ajaxMsg[i]);
		}
		
		return "./cart/cart_select";
	}
	
	//장바구니 상세보기 계산
	@RequestMapping(value = "/CartSelectCalculate", method = RequestMethod.POST)
	@ResponseBody
	public List<Object> CartCalculate(Model model, HttpServletRequest httpServletRequest, CartCalculateDTO cartCalculateDTO) {

		List<CartCalculateDTO> list = new ArrayList<>();
		List<Object> lists = new ArrayList<>();
		String[] ajaxMsg = httpServletRequest.getParameterValues("valueArr");
		int total = 0;
		int quantity = 0;
		int size = ajaxMsg.length;
		
		for (int i = 0; i < size; i++) {
			
			list.addAll(cartService.cartCalculate(ajaxMsg[i]));
		}
			
		for (int i = 0; i < list.size(); i++) {
			
			total = total + list.get(i).getCartcount() * list.get(i).getPprice();
			quantity = quantity + list.get(i).getCartcount();
		}

		lists.add(0, quantity);
		lists.add(1, total); 
		
		return lists;
	}

}
