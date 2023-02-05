package project.steam.abc.page.dto;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Component

@Getter

@Setter

@ToString

public class PageDTO {
	
	private int nowPage;
	private int pageBegin;
	private int pageEnd;
	private int total;
	private int countPerPage;
	private int lastPage;
	private int begin;
	private int end;
	
	private int countPage = 10;
	
	public PageDTO() {
		
	}
	
	public PageDTO(int total, int nowPage, int countPerPage) {
		
		setNowPage(nowPage);
		setCountPerPage(countPerPage);
		setTotal(total);
		lastPageCall(getTotal(), getCountPerPage());
		beginEndPageCall(getNowPage(), countPage);
		beginEndCall(getNowPage(), getCountPerPage());
		
	}

	public void lastPageCall(int total, int countPerPage) {

		setLastPage((int)Math.ceil((double)(total) / (double)countPerPage));
		
	}
	

	public void beginEndPageCall(int nowPage, int countPage) {

		setPageEnd(((int)Math.ceil((double)nowPage / (double)countPage)) * countPage);
		
		if(getLastPage() < getPageEnd()) {
			
			setPageEnd(getLastPage());
			
		}
		
		setPageBegin(getPageEnd() - countPage + 1);
		
		if(getPageBegin() < 1) {
			
			setPageBegin(1);
			
		}
		
		
	}

	public void beginEndCall(int nowPage, int countPerPage) {
		
		setEnd(nowPage * countPerPage);
		setBegin(getEnd() - countPerPage + 1);
		
	}

	
	

}
