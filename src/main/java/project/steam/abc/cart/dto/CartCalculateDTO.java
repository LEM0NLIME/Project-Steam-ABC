package project.steam.abc.cart.dto;

import org.springframework.stereotype.Component;


@Component


public class CartCalculateDTO {
	private int pcartid;
	private String pname;
	private int cartcount;
	private int pprice;
	
	
	public int getPcartid() {
		return pcartid;
	}
	public void setPcartid(int pcartid) {
		this.pcartid = pcartid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getCartcount() {
		return cartcount;
	}
	public void setCartcount(int cartcount) {
		this.cartcount = cartcount;
	}
	public int getPprice() {
		return pprice;
	}
	public void setPprice(int pprice) {
		this.pprice = pprice;
	}
	
	
}
