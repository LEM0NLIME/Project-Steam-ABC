package project.steam.abc.customer.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import project.steam.abc.customer.dto.CustomerDTO;
import project.steam.abc.customer.dto.PageMaker;
import project.steam.abc.customer.dto.SearchCriteria;
import project.steam.abc.customer.service.CustomerService;

//빈으로 컨트롤러 스캔을 구성하고 컨트롤러를 구현
@Controller
public class CustomerController {

	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);

//의존관계를 자동으로 설정 
	@Autowired
	private CustomerService customerService;

	
// 게시물 목록+페이징
	@RequestMapping(value = "/CustomerListPage", method = RequestMethod.GET)
	public String listPage(Model model, @ModelAttribute("searchCriteria") SearchCriteria searchCriteria) {

		model.addAttribute("list", customerService.listPage(searchCriteria));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(searchCriteria);
		pageMaker.setTotalCount(customerService.listCount(searchCriteria));

		model.addAttribute("pageMaker", pageMaker);

		return "./customer/customer_select_listpage";
	}

// 게시물 목록 상세조회
	@RequestMapping(value = "/CsSelectDetail", method = RequestMethod.GET)
	public String detail(Model model, CustomerDTO customerDTO) {

		model.addAttribute("customerDTO", customerService.csSelect(customerDTO.getSno()));
		return "./customer/customer_select_view";
	}

	// 게시물 작성
	@RequestMapping(value = "/CsInsert", method = RequestMethod.GET)
	public String insert() {
		return "./customer/customer_insert";
	}

	// 게시물 작성
	@RequestMapping(value = "/CsInsert", method = RequestMethod.POST)
	public String insert(Model model, CustomerDTO customerDTO, SearchCriteria searchCriteria) {
		logger.info("작성컨트롤러 시작");
		customerService.csInsert(customerDTO);

		List<CustomerDTO> list = customerService.listPage(searchCriteria);

		int num = list.get(0).getSno();

		model.addAttribute("num", num);

		return "./customer/customer_insert_view";
	}

//게시물 수정 
	@RequestMapping(value = "/CsUpdate", method = RequestMethod.GET)
	public String update(Model model, CustomerDTO customerDTO) {
		model.addAttribute("customerDTO", customerService.csSelect(customerDTO.getSno()));
		return "./customer/customer_update";
	}

//게시물 수정
	@RequestMapping(value = "/CsUpdate", method = RequestMethod.POST)
	public String update(CustomerDTO customerDTO) {
		customerService.csUpdate(customerDTO);
		return "./customer/customer_update_view";

	}

//게시물 삭제 
	@RequestMapping(value = "/CsDelete", method = RequestMethod.GET)
	public String delete(Model model, CustomerDTO customerDTO, HttpServletRequest request) {

		String sessionID = (String) request.getSession().getAttribute("sessionID");

		if (sessionID != null) {

			if (sessionID.equals("admin")) {

				model.addAttribute("customerDTO", customerService.csSelect(customerDTO.getSno()));
				return "./customer/customer_delete";

			} else {
				return "./customer/customer_error";
			}

		} else {
			return "./customer/customer_error";
		}
	}

//게시물 삭제
	@RequestMapping(value = "/CsDeleteCheck", method = RequestMethod.GET)
	public String delete(CustomerDTO customerDTO, HttpServletRequest request) {

		String sessionID = (String) request.getSession().getAttribute("sessionID");

		if (sessionID != null) {

			if (sessionID.equals("admin")) {

				customerService.csDelete(customerDTO.getSno());
				return "./customer/customer_delete_view";

			} else {
				return "./customer/customer_error";
			}

		} else {
			return "./customer/customer_error";
		}
	}
}
