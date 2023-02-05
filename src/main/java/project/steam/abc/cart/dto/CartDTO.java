package project.steam.abc.cart.dto;


import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Component
@Setter
@Getter
@ToString

public class CartDTO {
	private int pcartid;
	private String mid;
	private String pname;
	private int cartcount;
	private String pthumbimg;
	private int pprice;
	private int psize;
	private String pcolor;
	
}
