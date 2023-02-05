package project.steam.abc.page.dto;

import org.springframework.stereotype.Component;

@Component



public class PageDTO {
	
	private int nowPage;
	private int pageBegin;
	private int pageEnd;
	private int total;
	private int countPerPage;
	private int lastPage;
	private int begin;
	private int end;
	
	
	
	
	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getPageBegin() {
		return pageBegin;
	}

	public void setPageBegin(int pageBegin) {
		this.pageBegin = pageBegin;
	}

	public int getPageEnd() {
		return pageEnd;
	}

	public void setPageEnd(int pageEnd) {
		this.pageEnd = pageEnd;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getCountPerPage() {
		return countPerPage;
	}

	public void setCountPerPage(int countPerPage) {
		this.countPerPage = countPerPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public int getBegin() {
		return begin;
	}

	public void setBegin(int begin) {
		this.begin = begin;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getCountPage() {
		return countPage;
	}

	public void setCountPage(int countPage) {
		this.countPage = countPage;
	}

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
