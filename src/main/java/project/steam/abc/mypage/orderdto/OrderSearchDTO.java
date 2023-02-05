package project.steam.abc.mypage.orderdto;

import org.springframework.stereotype.Component;

@Component
public class OrderSearchDTO extends OrderPageDTO{
	
	private String searchType = "";
	private String keyword = "";
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	@Override
	public String toString() {
		return "OrderSearchDTO [searchType=" + searchType + ", keyword=" + keyword + "]";
	}
	
}
