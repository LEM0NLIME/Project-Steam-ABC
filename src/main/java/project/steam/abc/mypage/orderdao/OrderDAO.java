package project.steam.abc.mypage.orderdao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import project.steam.abc.mypage.orderdto.OrderDTO;
import project.steam.abc.mypage.orderdto.OrderPageDTO;
import project.steam.abc.mypage.orderdto.OrderSearchDTO;

@Repository
@EnableAspectJAutoProxy(proxyTargetClass = true)
public class OrderDAO {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<OrderDTO> ordListPage(OrderSearchDTO searchDTO) {
		return sqlSessionTemplate.selectList("ordListPage", searchDTO);
	}
	
	public int ordListCount(OrderSearchDTO searchDTO) {
		return sqlSessionTemplate.selectOne("ordListCount", searchDTO);
	}
	
	public List<OrderDTO> ordListPageMy(OrderPageDTO orderPageDTO) {
		return sqlSessionTemplate.selectList("ordListPageMy", orderPageDTO);
	}
	
	public int ordListCountMy(OrderPageDTO orderPageDTO) {
		return sqlSessionTemplate.selectOne("ordListCountMy", orderPageDTO);
	}
	
	public OrderDTO ordSelectDetail(int ordno) {
		return sqlSessionTemplate.selectOne("ordSelectDetail", ordno);
	}
	
	@Transactional
	public void ordInsert(OrderDTO orderDTO) {
		sqlSessionTemplate.insert("ordInsert", orderDTO);
	}
	
	@Transactional
	public void ordInsertAsLists(OrderDTO orderDTO) {
		sqlSessionTemplate.insert("ordInsertaslists", orderDTO);
	}
	
	public void ordUpdate(OrderDTO orderDTO) {
		sqlSessionTemplate.update("ordUpdate", orderDTO);
	}
	
	public void ordDelete(int ordno) {
		sqlSessionTemplate.delete("ordDelete", ordno);
	}

}
