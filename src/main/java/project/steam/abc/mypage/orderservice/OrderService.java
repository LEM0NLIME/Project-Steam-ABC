package project.steam.abc.mypage.orderservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import project.steam.abc.mypage.orderdao.OrderDAO;
import project.steam.abc.mypage.orderdto.OrderDTO;
import project.steam.abc.mypage.orderdto.OrderPageDTO;
import project.steam.abc.mypage.orderdto.OrderSearchDTO;

@Service
public class OrderService {
	
	@Autowired
	
	private OrderDAO orderDAO;
	
	public List<OrderDTO> ordListPage(OrderSearchDTO searchDTO) {
		return orderDAO.ordListPage(searchDTO);
	}
	
	public int ordListCount(OrderSearchDTO searchDTO) {
		return orderDAO.ordListCount(searchDTO);
	}
	
	public List<OrderDTO> ordListPageMy(OrderPageDTO orderPageDTO) {
		return orderDAO.ordListPageMy(orderPageDTO);
	}
	
	public int ordListCountMy(OrderPageDTO orderPageDTO) {
		return orderDAO.ordListCountMy(orderPageDTO);
	}
	
	public OrderDTO ordSelectDetail(int ordno) {
		return orderDAO.ordSelectDetail(ordno);
	}
	
	public void ordInsert(OrderDTO orderDTO) {
		try {
			orderDAO.ordInsert(orderDTO);
		} catch (DataIntegrityViolationException e) {
			e.printStackTrace();
		}
	}
	
	public void ordInsertAsLists(OrderDTO orderDTO) {
		try {
			
			orderDAO.ordInsertAsLists(orderDTO);
			
		} catch (DataIntegrityViolationException e) {
			
			e.printStackTrace();
			
		}
	}
	
	public void ordUpdate(OrderDTO orderDTO) {
		orderDAO.ordUpdate(orderDTO);
	}
	
	public void ordDelete(int ordno) {
		orderDAO.ordDelete(ordno);
	}

}
