package project.steam.abc.mypage.applicationcontroller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import project.steam.abc.mypage.applicationdto.ApplicationDTO;
import project.steam.abc.mypage.applicationdto.ApplicationPageDTO;
import project.steam.abc.mypage.applicationdto.ApplicationSearchDTO;
import project.steam.abc.mypage.applicationdto.PageMaker;
import project.steam.abc.mypage.applicationservice.ApplicationService;
import project.steam.abc.mypage.orderdto.OrderDTO;

@Controller
public class ApplicationController {
	
	private static final Logger logger = LoggerFactory.getLogger(ApplicationController.class);
	
	@Autowired
	private ApplicationService applicationService;
	
	@RequestMapping(value = "/ApplicationSelectDetail", method = RequestMethod.GET)
	public String aplSelectDetail(Model model, ApplicationDTO applicationDTO) {
		model.addAttribute("applicationDTO", applicationService.aplSelectDetail(applicationDTO.getAplno()));
		return "./application/application_select_detail_view";
	}
	
	@RequestMapping(value = "/ApplicationSelectAll", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("searchDTO")ApplicationSearchDTO searchDTO) {
		
		logger.info("list");
		
		model.addAttribute("list", applicationService.aplListPage(searchDTO));
		model.addAttribute("aplListCount", applicationService.aplListCount(searchDTO));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setApplicationPageDTO(searchDTO);
		pageMaker.setTotalCount(applicationService.aplListCount(searchDTO));
		
		model.addAttribute("pageMaker", pageMaker);
		
		logger.info("로그" + model, model);
		
		return "./application/application_select_all_view";
	}
	
	@RequestMapping(value = "/ApplicationSelectMy", method = RequestMethod.GET)
	public String myList(Model model, ApplicationPageDTO applicationPageDTO) {
		
		model.addAttribute("myList", applicationService.aplListPageMy(applicationPageDTO));
		model.addAttribute("aplListCountMy", applicationService.aplListCountMy(applicationPageDTO));
				
		PageMaker pageMaker = new PageMaker();
		pageMaker.setApplicationPageDTO(applicationPageDTO);
		pageMaker.setTotalCount(applicationService.aplListCountMy(applicationPageDTO));
		
		model.addAttribute("pageMaker", pageMaker);
		
		logger.info("로그" + model, model);
		
		return "./application/application_select_my_view";
	}
	
	@RequestMapping(value = "/ApplicationInsert", method = RequestMethod.GET)
	public String aplInsert(Model model, OrderDTO orderDTO) {
		model.addAttribute("orderDTO", orderDTO);
		return "./application/application_insert";
	}
	
	@RequestMapping(value = "/ApplicationInsert", method = RequestMethod.POST)
	public String aplInsert(Model model, ApplicationDTO applicationDTO) {
		applicationService.aplInsert(applicationDTO);
		model.addAttribute("applicationDTO", applicationDTO);
		return "./application/application_insert_view";
	}
	
	@RequestMapping(value = "/ApplicationUpdate", method = RequestMethod.GET)
	public String aplUpdate(Model model, ApplicationDTO applicationDTO) {
		model.addAttribute("applicationDTO", applicationService.aplSelectDetail(applicationDTO.getAplno()));
		return "./application/application_update";
	}
	
	@RequestMapping(value = "/ApplicationUpdate", method = RequestMethod.POST)
	public String aplUpdate(ApplicationDTO applicationDTO) {
		applicationService.aplUpdate(applicationDTO);
		return "./application/application_update_view";
	}
	
	@RequestMapping(value = "/ApplicationDelete", method = RequestMethod.GET)
	public String aplDelete(Model model, ApplicationDTO applicationDTO, @RequestParam("aplstate") String aplstate) {
		applicationDTO = applicationService.aplSelectDetail(applicationDTO.getAplno());
		model.addAttribute("aplstate", aplstate);
		model.addAttribute("applicationDTO", applicationDTO);
		return "./application/application_delete";
	}
	
	@RequestMapping(value = "/ApplicationDeleteView", method = RequestMethod.GET)
	public String aplDeleteView(Model model, ApplicationDTO applicationDTO, @RequestParam("aplstate") String aplstate) {
		model.addAttribute("aplstate", aplstate);
		model.addAttribute("applicationDTO", applicationDTO);
		applicationService.aplDelete(applicationDTO.getAplno());
		return "./application/application_delete_view";
	}
	
	@RequestMapping(value = "/ApplicationConfirm", method = RequestMethod.GET)
	public String aplConfirm(Model model,OrderDTO orderDTO) {
		
		model.addAttribute("orderDTO", orderDTO);
		return "./application/application_confirm";
	}
	
	@RequestMapping(value = "/ApplicationConfirm2", method = RequestMethod.GET)
	public String aplConfirm2(Model model, ApplicationDTO applicationDTO) {
		
		model.addAttribute("applicationDTO", applicationDTO);
		return "./application/application_confirm2";
	}
	
}
