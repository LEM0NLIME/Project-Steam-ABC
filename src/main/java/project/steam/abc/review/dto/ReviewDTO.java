package project.steam.abc.review.dto;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Component
@Getter
@Setter
@ToString

public class ReviewDTO {
	
//	리뷰테이블	
//	rvno	리뷰넘버
//	rvcontent	리뷰내용
//	rvorderno	오더넘버
//	mid	회원아이디
//	rvdate	리뷰작성날짜
//	rvrating	리뷰평점	
//	rvsize	사이즈 평가
//	rvcolor	색상 평가	
//	rvfile	리뷰 관련 파일
//
//	나의사이즈
//	mysize	나의 평소 신발 사이즈
//	myfootball	나의 평소 발볼은?
//	myinstep	나의 평소 발등은?


	
	//======== 리뷰 테이블 ========
	private int rvno;
	private String rvcontent;
	private int rvorderno;
	private String mid;
	private String rvdate;
	private String rvrating;
	private String rvsize;
	private String rvcolor;
	
	// ======= 리뷰 관련 파일 ======
//	private byte rvfile;
	private String rvimg;
	private String rvthumbimg;
	
	
	// ========= 나의사이즈 ==========
	private String mysize;
	private String myfootball;
	private String myinstep;
	
	
	
	
	
		
	
}
