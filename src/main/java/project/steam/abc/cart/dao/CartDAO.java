package project.steam.abc.cart.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Repository;

import project.steam.abc.cart.dto.CartCalculateDTO;
import project.steam.abc.cart.dto.CartDTO;
import project.steam.abc.mypage.orderdto.OrderDTO;

@Repository

//메소드를 호출할 때 자동으로 인터셉트
@EnableAspectJAutoProxy(proxyTargetClass = true)
public class CartDAO {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	/* 카트 추가 */
	public int addCart(CartDTO cartDTO) throws Exception {
		return sqlSessionTemplate.insert("cartInsert", cartDTO);
	}

	/* 카트 삭제 */
	public void deleteCart(String pcartid) {
		sqlSessionTemplate.delete("cartDelete", pcartid);
	}


	/* 카트 목록 */
	public List<CartDTO> cartSelect(String mid) {
		return sqlSessionTemplate.selectList("cartSelect", mid);
	}

	public List<CartDTO> cartSelectAll() {
		return sqlSessionTemplate.selectList("cartSelectAll");
	}

	/* 카트 확인 */
	public CartDTO checkCart(CartDTO cartDTO) {
		return sqlSessionTemplate.selectOne("checkCart", cartDTO);
	}
	
	/* 카트 목록 */
	public List<CartDTO> orderCartCheck(Object pname) {
		return sqlSessionTemplate.selectList("orderCartCheck", pname);
	}
	
	/* 카트 목록 */
	public List<OrderDTO> orderCartCheckAsOrder(Object pname) {
		return sqlSessionTemplate.selectList("orderCartCheckAsOrder", pname);
	}
	
	/* 카트 확인 */
	public List<CartCalculateDTO> cartCalculate(String pcartid) {
		
		return sqlSessionTemplate.selectList("cartCalculate", pcartid);
	}
	
	
}
