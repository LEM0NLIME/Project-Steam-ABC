package project.steam.abc.event.controller;

import java.io.File;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import project.steam.abc.event.dto.Criteria;
import project.steam.abc.event.dto.EventDTO;
import project.steam.abc.event.dto.PageMaker;
import project.steam.abc.event.service.EventService;
import project.steam.abc.event.utils.EventUploadFile;

@Controller
public class EventController {
	private static final Logger logger = LoggerFactory.getLogger(EventController.class);

	@Autowired
	private EventService eventService;
	
	@Autowired(required = false)
	@Qualifier("uploadPath")
	private String uploadPath;

	@RequestMapping(value = "/EventSelect", method = RequestMethod.GET)
	public String list(Model model, Criteria cri) throws Exception {

		model.addAttribute("list", eventService.eventSelectAll(cri));
		logger.info("list", model);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(eventService.listCount());
		
		model.addAttribute("pageMaker", pageMaker);

		return "./event/event_select_all_view";

	}
	
	

	@RequestMapping(value = "/EventSelectDetail", method = RequestMethod.GET)
	public String detail(Model model, EventDTO eventDTO) {
		model.addAttribute("eventDTO", eventService.eventSelect(eventDTO.getEno()));
		return "./event/event_select_view";

	}

	@RequestMapping(value = "/EventInsert", method = RequestMethod.GET)
	public String insert() {
		return "./event/event_insert";
	}

	@RequestMapping(value = "/EventInsert", method = RequestMethod.POST)
	public String insert(Model model, EventDTO eventDTO, MultipartFile multipartFile, Criteria cri) throws Exception{
		
		
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = EventUploadFile.calcPath(imgUploadPath);
		String fileName = null;
		
		if(multipartFile!=null) {
			fileName=EventUploadFile.fileUpload(imgUploadPath, multipartFile.getOriginalFilename(), multipartFile.getBytes(), ymdPath);
			
		}else {
			fileName=uploadPath+File.separator+"images"+File.separator+"none.png";
			
		}
		
		eventDTO.setEimg(File.separator+"imgUpload"+ymdPath+File.separator+fileName);
		eventDTO.setEfile(File.separator+"imgUpload"+ymdPath+File.separator+"s"+File.separator+"s_"+fileName);
		
		model.addAttribute("list", eventService.eventSelectAll(cri));
		eventService.eventInsert(eventDTO);
		
		return "./event/event_insert_view";

	}
	
	@RequestMapping(value="/EventUpdate", method = RequestMethod.GET)
	public String update(Model model, EventDTO eventDTO) {
		model.addAttribute("eventDTO", eventService.eventSelect(eventDTO.getEno()));
		return "./event/event_update";
	}

	@RequestMapping(value="/EventUpdate", method = RequestMethod.POST)
	public String update(EventDTO eventDTO, MultipartFile multipartFile, HttpServletRequest req) throws Exception {
		
		if(multipartFile.getOriginalFilename() != null && multipartFile.getOriginalFilename() != "") {
			
			logger.info("eimg"+req.getParameter("eimg"));
			
			new File(uploadPath+req.getParameter("eimg")).delete();
			new File(uploadPath+req.getParameter("efile")).delete();
			
			String imgUploadPath = uploadPath + File.separator+"imgUpload";
			String ymdPath = EventUploadFile.calcPath(imgUploadPath);
			String fileName = EventUploadFile.fileUpload(imgUploadPath, multipartFile.getOriginalFilename(), multipartFile.getBytes(), ymdPath);
			
			eventDTO.setEimg(File.separator+"imgUpload"+ymdPath+File.separator+fileName);
			eventDTO.setEfile(File.separator+"imgUpload"+ymdPath+File.separator+"s"+File.separator+"s_"+fileName);
			
		} else {
			eventDTO.setEimg(req.getParameter("eimg"));
			eventDTO.setEfile(req.getParameter("efile"));
		}
		
		
		
		eventService.eventUpdate(eventDTO);
		return "./event/event_update_view";
	}
	
	@RequestMapping(value="/EventDelete", method = RequestMethod.GET)
	public String delete(Model model, HttpServletRequest request, EventDTO eventDTO) {
		
		String sessionID = (String) request.getSession().getAttribute("sessionID");
		String permission = "unavailable";
		
		if(sessionID != null) {
			
			if(sessionID.equals("admin")) {
		
		eventDTO = eventService.eventSelect(eventDTO.getEno());
		
		new File(uploadPath + eventDTO.getEimg()).delete();
		new File(uploadPath + eventDTO.getEfile()).delete();
		
		eventService.eventDelete(eventDTO.getEno());
		
		permission = "available";
		
		model.addAttribute("permission", permission);
		return "./event/event_delete_view";
		
			}else {
				
				model.addAttribute("permission", permission);
				return "./event/event_delete_view";
				
			}
		
		}else {
			
			model.addAttribute("permission", permission);
			return "./event/event_delete_view";
		}
		
	}
	
	
	
}
