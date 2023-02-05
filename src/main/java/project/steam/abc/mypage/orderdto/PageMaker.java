package project.steam.abc.mypage.orderdto;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {
	
	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int displayPageNum = 10;
	private OrderPageDTO orderPageDTO;
	private String mid;
	
	public void setMid(String mid) {
		this.mid = mid;
	}
	public void setOrderPageDTO(OrderPageDTO orderPageDTO) {
		this.orderPageDTO = orderPageDTO;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}
	public int getTotalCount() {
		return totalCount;
	}
	public int getStartPage() {
		return startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	
	public String getMid() {
		return mid;
	}
	public boolean isPrev() {
		return prev;
	}
	public boolean isNext() {
		return next;
	}
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	public OrderPageDTO getOrderPageDTO() {
		return orderPageDTO;
	}
	private void calcData() {
		endPage = (int) (Math.ceil(orderPageDTO.getPage() / (double)displayPageNum) * displayPageNum);
		startPage = (endPage - displayPageNum) + 1;
		
		int tempEndPage = (int) (Math.ceil(totalCount / (double)orderPageDTO.getPerPageNum()));
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		prev = startPage == 1 ? false : true;
		next = endPage * orderPageDTO.getPerPageNum() >= totalCount ? false : true;
	}
	
	public String makeQuery(int page) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page).queryParam("perPageNum", orderPageDTO.getPerPageNum()).build();
		return uriComponents.toUriString();
	}

}
