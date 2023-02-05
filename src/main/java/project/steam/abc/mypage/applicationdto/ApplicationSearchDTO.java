package project.steam.abc.mypage.applicationdto;

import org.springframework.stereotype.Component;

@Component
public class ApplicationSearchDTO extends ApplicationPageDTO{
	
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
		return "ApplicationSearchDTO [searchType=" + searchType + ", keyword=" + keyword + "]";
	}
	
}
