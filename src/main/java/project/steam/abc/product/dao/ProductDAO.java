package project.steam.abc.product.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import project.steam.abc.mypage.orderdto.OrderDTO;
import project.steam.abc.product.dto.ProductDTO;
import project.steam.abc.product.dto.ProductSearchCriteria;

//빈으로 DB 스캔 구성
@Repository

@EnableAspectJAutoProxy(proxyTargetClass = true)
public class ProductDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	//전체조회 + 파일 업로드
	public List<ProductDTO> productSelectAll(){
		return sqlSessionTemplate.selectList("productSelectAll");
	}
	
	//전체 조회 + 페이징 
	public List<ProductDTO> selectAlls(ProductSearchCriteria productSearchCriteria){
		return sqlSessionTemplate.selectList("listPage",productSearchCriteria);
	}
	public int listCount(ProductSearchCriteria productSearchCriteria) {
		return sqlSessionTemplate.selectOne("listCount",productSearchCriteria);
	}
	
	//상품조회
	public ProductDTO productSelect(String pname) {
		return sqlSessionTemplate.selectOne("productSelect", pname);
	}
	
	//상품조회 반환 OrderDTO
	public OrderDTO productSelectAsOrder(String pname) {
		return sqlSessionTemplate.selectOne("productSelectAsOrder", pname);
	}

	//상품등록
	@Transactional
	public void productInsert(ProductDTO productDTO) {
		sqlSessionTemplate.insert("productInsert",productDTO);
	}
	//상품수정
	public void productUpdate(ProductDTO productDTO) {
		sqlSessionTemplate.update("productUpdate",productDTO);
	}
	//상품 아이디 부여
	public void productUpdateSetMid(ProductDTO productDTO) {
		sqlSessionTemplate.update("productUpdateSetMid",productDTO);
	}
	//상품삭제
	public void productDelete(String pname) {
		sqlSessionTemplate.delete("productDelete", pname);
	}
	
}
