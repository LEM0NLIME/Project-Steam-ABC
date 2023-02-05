package project.steam.abc.product.dto;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Component
@Setter
@Getter
@ToString

public class ProductDTO {
	private String pname;
	private String pbrand;
	private String psize;
	private String pcolor;
	private String psn;
	private String pinfo;
	private String pimg;
	private String pthumbimg;
	private String mid;
	private int pprice;
	private int pno; 
}
