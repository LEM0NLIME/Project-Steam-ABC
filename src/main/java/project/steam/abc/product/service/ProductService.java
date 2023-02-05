package project.steam.abc.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import project.steam.abc.mypage.orderdto.OrderDTO;
import project.steam.abc.product.dao.ProductDAO;
import project.steam.abc.product.dto.ProductDTO;
import project.steam.abc.product.dto.ProductSearchCriteria;

//빈 으로 비지니스 로직 스캔 구성
@Service
public class ProductService {

	@Autowired
	private ProductDAO productDAO;
	//전체조회 + 파일 업로드
	public List<ProductDTO> productSelectAll() {
		return productDAO.productSelectAll();
	}

	//전체 조회 + 페이징
	public List<ProductDTO> productSelectAlls(ProductSearchCriteria productSearchCriteria){
		return productDAO.selectAlls(productSearchCriteria);
	}
	public int listCount(ProductSearchCriteria productSearchCriteria) {
		return productDAO.listCount(productSearchCriteria);
	}
	
	
	//상품조회
	public ProductDTO productSelect(String pname) {
		return productDAO.productSelect(pname);
	}
	
	//상품조회 반환 OrderDTO
	public OrderDTO productSelectAsOrder(String pname) {
		return productDAO.productSelectAsOrder(pname);
	}
	
	//상품등록
	public void productInsert(ProductDTO productDTO) {
		try {
			productDAO.productInsert(productDTO);

		} catch (DataIntegrityViolationException e) {
			e.printStackTrace();
		}
	}
	//상품수정
	public void productUpdate(ProductDTO productDTO) {
		productDAO.productUpdate(productDTO);
	}
	//상품 아이디 부여
	public void productUpdateSetMid(ProductDTO productDTO) {
		productDAO.productUpdateSetMid(productDTO);
	}
	//상품삭제
	public void productDelete(String pname) {
		productDAO.productDelete(pname);
	}
	
	
}
