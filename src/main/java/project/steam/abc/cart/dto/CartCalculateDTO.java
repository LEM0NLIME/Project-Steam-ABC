package project.steam.abc.cart.dto;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Component
@Setter
@Getter
@ToString

public class CartCalculateDTO {
	private int pcartid;
	private String pname;
	private int cartcount;
	private int pprice;
	
}
