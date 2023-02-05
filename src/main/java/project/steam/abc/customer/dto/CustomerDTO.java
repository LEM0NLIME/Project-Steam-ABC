package project.steam.abc.customer.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Component
@Setter
@Getter
@ToString


public class CustomerDTO {

	
	private int sno;
	private String stitle;
	private String scontent;
	private Date sregdate;

}
