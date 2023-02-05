package project.steam.abc.review.controller;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;
import project.steam.abc.review.dto.ReviewDTO;
import project.steam.abc.review.service.ReviewService;
import project.steam.abc.review.utils.PageMaker;
import project.steam.abc.review.utils.SearchPaging;
import project.steam.abc.review.utils.UploadFileUtils;

@Controller

@Slf4j

public class ReviewController {

	@Autowired
	private ReviewService reviewService;

	@Autowired(required = false)
	@Qualifier("uploadPath")
	private String uploadPath;

	@RequestMapping("/ReviewSelectDetail")
	public String detail(Model model, ReviewDTO reviewDTO) {
		model.addAttribute("reviewDTO", reviewService.reviewSelect(reviewDTO.getRvno()));
		log.info("상세 조회" + model);
		return "./review/review_select_view";
	}

	@RequestMapping("/ReviewInsert")
	public String insert() {
		return "./review/review_insert";
	}

	@RequestMapping(value = "/ReviewInsert", method = RequestMethod.POST)
	public String insert(Model model, MultipartFile file, ReviewDTO reviewDTO) throws Exception {

		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if (file != null) {
			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
		} else {
			fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		reviewDTO.setRvimg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		reviewDTO.setRvthumbimg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);

		reviewService.reviewInsert(reviewDTO);
		model.addAttribute("list", reviewService.reviewSelectAll());

		log.info("리뷰 작성 값 확인 ===============" + model);
		log.info("리뷰 작성 값 확인 ===============" + reviewService);
		
		return "./review/review_insert_view";

	}

	// ========== 리뷰 수정 ==============

	@RequestMapping(value = "/ReviewUpdate", method = RequestMethod.GET)

	public String update(Model model, ReviewDTO reviewDTO) {

		model.addAttribute("reviewDTO", reviewService.reviewSelect(reviewDTO.getRvno()));
//		model.addAttribute("list", reviewService.reviewSelectAll());
		return "./review/review_update";
	}

	@RequestMapping(value = "/ReviewUpdate", method = RequestMethod.POST)

	public String update( MultipartFile file,  ReviewDTO reviewDTO ) throws  Exception {
		
		log.info("post reviewDTO review_update");

		   // 새로운 파일이 등록되었는지 확인
		   if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {

		    new File(uploadPath + reviewDTO.getRvimg()).delete();
		    new File(uploadPath + reviewDTO.getRvthumbimg()).delete();
		    
		    // 새로 첨부한 파일을 등록
		    String imgUploadPath = uploadPath + File.separator + "imgUpload";
		    String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		    String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
		    
		    reviewDTO.setRvimg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		    reviewDTO.setRvthumbimg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		    
		   } else { 
			   
		    reviewDTO.setRvimg(reviewDTO.getRvimg());
		    reviewDTO.setRvimg(reviewDTO.getRvthumbimg());
		    
		   }
		   
			reviewService.reviewUpdate(reviewDTO);
			
			System.out.println("리뷰 디티오 ==========" + reviewDTO);
			System.out.println("리뷰 서비스 ==========" + reviewService);
			
		return "./review/review_update_view";

	}
	
	
	

	// =========== 리뷰 삭제 ============

	@RequestMapping(value = "/ReviewDelete", method = RequestMethod.GET)
	public String delete(Model model, ReviewDTO reviewDTO) {
		
		model.addAttribute("reviewDTO", reviewDTO);
		return "./review/review_delete";
	}

	@RequestMapping(value = "/ReviewDeleteView", method = RequestMethod.GET)
	public String deleteView(Model model, ReviewDTO reviewDTO) {

		reviewService.reviewDelete(reviewDTO.getRvno());
		model.addAttribute("reviewDTO", reviewDTO);
		return "./review/review_delete_view";
	}
	
	
	// =========== 리뷰 목록 조회 ============
	
	@RequestMapping ( value = "/ReviewSelect", method = RequestMethod.GET)
	public String list ( Model model , SearchPaging searchPaging) throws Exception{
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setPaging(searchPaging);
		pageMaker.setTotalCount(reviewService.rvCount(searchPaging));
		
		model.addAttribute("list", reviewService.list(searchPaging));
		model.addAttribute("pageMaker", pageMaker);
		
		return "review/review_select_all_view";
		
	}
	
	// ============ 리뷰 검색 ============
	@RequestMapping(value = "/readView", method = RequestMethod.GET)
	public String read(ReviewDTO reviewDTO, @ModelAttribute("searchPaging") SearchPaging searchPaging, Model model) throws Exception{
		
		model.addAttribute("read", reviewService.read(reviewDTO.getRvno()));
		model.addAttribute("searchPaging", searchPaging);
		return "review/readView";
	}
	
	
		
		
	}
	

