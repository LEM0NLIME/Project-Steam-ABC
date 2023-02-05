package project.steam.abc.product.controller;


import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import project.steam.abc.product.dto.ProductPageMaker;
import project.steam.abc.product.dto.ProductDTO;
import project.steam.abc.product.dto.ProductSearchCriteria;
import project.steam.abc.product.service.ProductService;
import project.steam.abc.product.utils.ProductUploadFileUtils;

@Controller
public class ProductController {
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Autowired
	private ProductService productService;
	
	@Autowired(required=false)
	@Qualifier("uploadPath" )
	private String uploadPath;
	
	//상품 전체조회
	@RequestMapping(value = "/ProductSelect", method = RequestMethod.GET)
	public String items(Model model, @ModelAttribute("productSearchCriteria") ProductSearchCriteria productSearchCriteria) {
		
		model.addAttribute("items", productService.productSelectAlls(productSearchCriteria));
		
		ProductPageMaker pageMaker = new ProductPageMaker();
		pageMaker.setCri(productSearchCriteria);
		pageMaker.setTotalCount(productService.listCount(productSearchCriteria));

		model.addAttribute("pageMaker", pageMaker);
		
		logger.info(" items 로그 확인 - " , model);
		return "./product/product_select_all_view";
	}
	
	//상품 상세 조회
	@RequestMapping(value = "/ProductSelectDetail", method = RequestMethod.GET)
	public String productDetail(Model model, ProductDTO productDTO) {
		model.addAttribute("productDTO",productService.productSelect(productDTO.getPname()));
		logger.info(" productDetail 로그 확인 " , model);
		return "./product/product_select_view";
	}
	
	//상품 등록
	@RequestMapping(value = "/ProductInsert", method = RequestMethod.GET)
	public String prdouctInsert() {
		return "./product/product_insert";
	}
	@RequestMapping(value = "/ProductInsert", method = RequestMethod.POST)
	public String prdouctInsert(Model model, ProductDTO productDTO , MultipartFile multipartFile)throws Exception{

		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = ProductUploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;
		
		if (multipartFile != null) {
			fileName = ProductUploadFileUtils.fileUpload(imgUploadPath, multipartFile.getOriginalFilename(),multipartFile.getBytes(), ymdPath);
		}else {
			fileName = uploadPath + File.separator + "imges" + File.separator + "none.png";
		}
		
		productDTO.setPimg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		productDTO.setPthumbimg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		
		model.addAttribute("items", productService.productSelectAll());
		productService.productInsert(productDTO);
		
		return "./product/product_insert_view";
	}
	
	//상품 수정
	@RequestMapping(value = "/ProductUpdate", method = RequestMethod.GET)
	public String prdouctUpdate(Model model,ProductDTO productDTO) {
		model.addAttribute("productDTO", productService.productSelect(productDTO.getPname()));
		return "./product/product_update";
	}
	@RequestMapping(value = "/ProductUpdate", method = RequestMethod.POST)
	public String prdouctUpdate(Model model ,ProductDTO productDTO, MultipartFile multipartFile ,HttpServletRequest httpServletRequest) throws Exception {
			
		// 새로운 파일 등록 되어있는지 확인
		if (multipartFile.getOriginalFilename() != null && multipartFile.getOriginalFilename() != "") {
			
			//기존 파일 삭제
			new File(uploadPath + httpServletRequest.getParameter("pimg")).delete();
			new File(uploadPath + httpServletRequest.getParameter("pthumbimg")).delete();
			
			//새로 첨부한 파일 등록
			String imgUploadPath = uploadPath + File.separator + "imgUpload";
			String ymdPath = ProductUploadFileUtils.calcPath(imgUploadPath);
			String fileName = ProductUploadFileUtils.fileUpload(imgUploadPath, multipartFile.getOriginalFilename(), multipartFile.getBytes() , ymdPath);
			logger.info("사진 업데이트 로그확인 사진 ",fileName);
			
			productDTO.setPimg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			productDTO.setPthumbimg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
			logger.info("사진 업데이트 로그확인",productDTO);
		}else {
			productDTO.setPimg(httpServletRequest.getParameter("pimg"));
			productDTO.setPthumbimg(httpServletRequest.getParameter("pthumbimg"));
		}
		
		productService.productUpdate(productDTO);
		return "./product/product_update_view";
	}
	
	//상품 삭제
	@RequestMapping(value = "/ProductDelete", method = RequestMethod.GET)
	public String prdouctDeleteView(ProductDTO productDTO, HttpServletRequest httpServletRequest) {
		
		String sessionID = (String) httpServletRequest.getSession().getAttribute("sessionID");
		
		if(sessionID != null) {
			
			if(sessionID.equals("admin")) {
				
				productDTO = productService.productSelect(productDTO.getPname());
				
				new File(uploadPath + productDTO.getPimg()).delete();
				new File(uploadPath + productDTO.getPthumbimg()).delete();
				
				productService.productDelete(productDTO.getPname());
				return "./product/product_delete_view";
				
			}else {
				
				return "./product/product_authority";
				
			}
			
		}
		
		return "./product/product_authority";
	}
	
	
}
