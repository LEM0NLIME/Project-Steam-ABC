package project.steam.abc.mypage.applicationdto;

import org.springframework.stereotype.Component;

@Component
public class ApplicationPageDTO {
	
	private String mid;
	private int page;
	private int perPageNum;
	private int rowStart;
	private int rowEnd;
	
	public ApplicationPageDTO() {
		this.page = 1;
		this.perPageNum = 10;
	}
	
	public void setMid(String mid) {
		this.mid = mid;
	}

	public void setPage(int page) {
		if (page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}
	
	public void setPerPageNum(int perPageNum) {
		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}

	public String getMid() {
		return mid;
	}
	
	public int getPage() {
		return page;
	}
	
	public int getPageStart() {
		return (this.page -1) * perPageNum;
	}

	public int getPerPageNum() {
		return this.perPageNum;
	}

	public int getRowStart() {
		rowStart = ((page -1) * perPageNum) +1;
		return rowStart;
	}

	public int getRowEnd() {
		rowEnd = rowStart + perPageNum -1;
		return rowEnd;
	}

	@Override
	public String toString() {
		return "OrderPageDTO [page=" + page + ", perPageNum=" + perPageNum + ", rowStart=" + rowStart + ", rowEnd="
				+ rowEnd + "]";
	}

}
