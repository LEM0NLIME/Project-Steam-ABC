package project.steam.abc.mypage.orderdto;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Component
@Setter
@Getter
@ToString
public class OrderDTO {
	
	private int ordno;
	private String mid;
	private String mname;
	private String pbrand;
	private String pname;
	private int psize;
	private String pcolor;
	private int pprice;
	private int ptotal;
	private String pimg;
	private int pquantity;
	private String ordaddress;
	private Date orddate;
	private String ordsituation;

}

