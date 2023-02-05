package project.steam.abc.cart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.steam.abc.cart.dao.CartDAO;
import project.steam.abc.cart.dto.CartCalculateDTO;
import project.steam.abc.cart.dto.CartDTO;
import project.steam.abc.mypage.orderdto.OrderDTO;

@Service
public class CartService {

	@Autowired
	private CartDAO cartDAO;
	
	
	public List<CartDTO> cartCheck(Object pname){

		List<CartDTO> cart = cartDAO.orderCartCheck(pname);
		
		return cart;
		
	}
	
	public List<OrderDTO> cartCheckAsOrder(Object pname){

		List<OrderDTO> cart = cartDAO.orderCartCheckAsOrder(pname);
		
		return cart;
		
	}
	
	//장바구니 등록
	public int cartInsert(CartDTO cartDTO) {

		CartDTO checkCart = cartDAO.checkCart(cartDTO);
		
		if(checkCart != null) {
			return 2;
		}

		try {
			return cartDAO.addCart(cartDTO);
		} catch (Exception e) {
			return 0;
		}
	}

	//장바구니 상세 조회
	public List<CartDTO> cartSelect(String mid){
		
		List<CartDTO> cart = cartDAO.cartSelect(mid);
		return cart;
	}
	
	//장바구니 전체 조회
	public List<CartDTO> cartSelectAll(){
		return cartDAO.cartSelectAll();
	}
	
	//장바구니 삭제
	public void cartDelete(String pcartid) {
		cartDAO.deleteCart(pcartid);
	}
	
	public List<CartCalculateDTO> cartCalculate(String pcartid) {
		return cartDAO.cartCalculate(pcartid);
	}

	
}
