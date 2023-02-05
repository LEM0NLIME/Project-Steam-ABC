package project.steam.abc.mypage.applicationdto;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Component
@Setter
@Getter
@ToString
public class ApplicationDTO {
	
	private int aplno;
	private String mid;
	private String pbrand;
	private String pname;
	private String pcolor;
	private int psize;
	private String aplcontents;
	private String aplreasons;

}
