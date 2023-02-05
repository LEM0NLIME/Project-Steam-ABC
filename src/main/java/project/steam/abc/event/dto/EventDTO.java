package project.steam.abc.event.dto;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Component
@Getter
@Setter
@ToString

public class EventDTO {
	
	private int eno;
	private String ename;
	private String eperiod;
	private String edate;
	private String etarget;
	private String etype;
	private String edcrate;
	private String eimg;
	private String efile;
	
}