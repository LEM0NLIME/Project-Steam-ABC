package project.steam.abc.member.controller;

import java.util.HashMap;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;
import project.steam.abc.member.dto.MemberDTO;
import project.steam.abc.member.dto.MemberDTO2;
import project.steam.abc.member.service.MemberService;
import project.steam.abc.page.dto.PageDTO;

@Controller

public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService memberService;
	@Autowired(required = false)
	private JavaMailSender javaMailSender;

	// 메인화면
	@RequestMapping(value = "/MemberMain", method = RequestMethod.GET)

	public String memberMain(Model model) {

		return "/member/member_main";
	}

	// 관리자 - 회원 전체조회
	@RequestMapping(value = "/MemberInquiryAll", method = RequestMethod.GET)

	public String list(Model model, PageDTO pageDTO, @RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "countPerPage", required = false) String countPerPage) {

		int total = memberService.countMembers();

		if (nowPage == null && countPerPage == null) {

			nowPage = "1";
			countPerPage = "10";

		} else if (nowPage == null) {

			nowPage = "1";

		} else if (countPerPage == null) {

			countPerPage = "10";

		}

		pageDTO = new PageDTO(total, Integer.parseInt(nowPage), Integer.parseInt(countPerPage));

		model.addAttribute("page", pageDTO);
		model.addAttribute("List", memberService.memberInquiryAll(pageDTO));

		return "./member/member_inquiry_all_view";
	}

	// 관리자 - 회원 상세조회
	@RequestMapping(value = "/MemberInquiryDetail", method = RequestMethod.GET)

	public String inquiryDetail(Model model, @RequestParam("mid") String mid) {

		model.addAttribute("memberDTO", memberService.memberInquiryDetail(mid));
		logger.info("memberDTO", model);

		return "./member/member_inquiry_detail_view";
	}

	// 관리자 - 회원등록 GET
	@RequestMapping(value = "/MemberInsert", method = RequestMethod.GET)

	public String memberInsert(Model model) {

		return "./member/member_insert";
	}

	// 관리자 - 회원등록 GET
	@RequestMapping(value = "/MemberInsertView", method = RequestMethod.POST)

	public String memberInsert(Model model, MemberDTO memberDTO) {

		memberService.memberInsert(memberDTO);

		model.addAttribute("memberDTO", memberService.memberInquiryDetail(memberDTO.getMid()));

		return "./member/member_insert_view";
	}

	// 회원 - 회원가입
	@RequestMapping(value = "/MemberInsertAsMember", method = RequestMethod.POST)

	public String memberInsertAsMember(Model model, MemberDTO memberDTO) {

		memberService.memberInsert(memberDTO);

		memberDTO = memberService.memberInquiryDetail(memberDTO.getMid());

		String joinID = memberDTO.getMid();

		model.addAttribute("joinID", joinID);

		return "/member/member_login";
	}

	// 회원 - 아이디 찾기 후 로그인
	@RequestMapping(value = "/MemberLogInAsSearch", method = RequestMethod.POST)

	public String memberInsertAsSearch(Model model, MemberDTO memberDTO) {

		String joinID = memberDTO.getMid();

		model.addAttribute("joinID", joinID);

		return "/member/member_login";
	}

	// 관리자 - 회원수정 GET
	@RequestMapping(value = "/MemberUpdate", method = RequestMethod.GET)

	public String memberUpdate(Model model, MemberDTO memberDTO) {

		model.addAttribute("memberDTO", memberService.memberInquiryDetail(memberDTO.getMid()));

		return "./member/member_update";
	}

	// 관리자 - 회원수정 POST
	@RequestMapping(value = "/MemberUpdate", method = RequestMethod.POST)

	public String memberUpdate(Model model, MemberDTO memberDTO, MemberDTO2 memberDTO2) {

		memberDTO2 = memberService.memberPreInquiryDetail(memberDTO2.getMid());

		model.addAttribute("memberDTO2", memberDTO2);

		memberService.memberUpdate(memberDTO);

		memberService.memberInquiryDetail(memberDTO.getMid());
		model.addAttribute("memberDTO", memberDTO);

		return "./member/member_update_view";
	}

	// 관리자 - 회원삭제 GET
	@RequestMapping(value = "/MemberDelete", method = RequestMethod.GET)

	public String memberDelete(Model model, MemberDTO memberDTO, HttpSession session) {

		if(memberDTO.getMname() != null) {
			
			if(memberDTO.getMname().equals("asMember")) {
				
				memberService.memberDelete(memberDTO.getMid());
				session.invalidate();
				
				return "./member/member_main";
				
			}
			
		}
		
		model.addAttribute("memberDTO", memberService.memberInquiryDetail(memberDTO.getMid()));

		return "./member/member_delete";
	}

	// 관리자 - 회원삭제 POST
	@RequestMapping(value = "/MemberDeleteView", method = RequestMethod.GET)

	public String memberDeleteView(Model model, MemberDTO memberDTO) {

		model.addAttribute("memberDTO", memberService.memberInquiryDetail(memberDTO.getMid()));

		memberService.memberDelete(memberDTO.getMid());

		return "./member/member_delete_view";
	}

	@RequestMapping(value = "/MemberJoin", method = RequestMethod.GET)

	public String memberJoin(Model model) {

		return "/member/member_join";
	}

	// 회원 - 아이디 중복 체크
	@RequestMapping(value = "/MemberDupCheck", method = RequestMethod.GET)
	@ResponseBody
	public String memberDupCheck(Model model, MemberDTO memberDTO) {

		int checkResult = memberService.idCheck(memberDTO);

		if (checkResult > 0) {

			return "unavailable";

		} else {

			return "available";

		}

	}

	// 회원 - 아이디 찾기
	@RequestMapping(value = "/MemberIdSearch", method = RequestMethod.GET)

	public String memberIdSearch() {

		return "./member/member_id_search";
	}
	// 회원 - 아이디 찾기 뷰
	@RequestMapping(value = "/MemberIdSearchView", method = RequestMethod.GET)

	public String memberIdSearchView(Model model, MemberDTO memberDTO) {

		String searchResult = "none";
		String mname = memberDTO.getMname();
		String mphonenum = memberDTO.getMphonenum();

		if (memberService.memberIdSearch(memberDTO) != null) {

			memberDTO = memberService.memberIdSearch(memberDTO);

			if (memberDTO.getMname() != null && memberDTO.getMphonenum() != null) {

				if (mname.equals(memberDTO.getMname()) && mphonenum.equals(memberDTO.getMphonenum())) {

					searchResult = "available";
					model.addAttribute("searchResult", searchResult);
					model.addAttribute("memberDTO", memberDTO);
					return "./member/member_id_search_view";

				} else {

					model.addAttribute("searchResult", searchResult);
					return "./member/member_id_search_view";

				}

			} else {

				model.addAttribute("searchResult", searchResult);
				return "./member/member_id_search_view";

			}

		} else {

			model.addAttribute("searchResult", searchResult);
			return "./member/member_id_search_view";

		}

	}

	//회원 - 이메일 인증
	@RequestMapping(value = "/MemberMailCertification", method = RequestMethod.GET)
	@ResponseBody
	public String sendEmail(Model model, MemberDTO memberDTO) throws Exception {
		
        Random random = new Random();
        int checkNum = random.nextInt(8889) + 1111;
        logger.info("메일 인증번호 " + checkNum);

		String subject = "ABC_MART 인증번호";
		String content = "인증번호는 " + checkNum + " 입니다.";
		String senderMail = "mail_sender_2023@naver.com";
		String receiverMail = memberDTO.getMemail();
		String certificationNum = ""+ checkNum;
		
		MimeMessage mimeMessage = javaMailSender.createMimeMessage();
		MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
		
		mimeMessageHelper.setFrom(senderMail);
		mimeMessageHelper.setTo(receiverMail);
		mimeMessageHelper.setSubject(subject);
		mimeMessageHelper.setText(content, true);
		
		javaMailSender.send(mimeMessage);
		logger.info("메일 전송 확인 - " + mimeMessage);
		
		return certificationNum;
	}
	
	//회원 휴대폰 인증
	@RequestMapping(value = "/MemberPhoneCertification", method = RequestMethod.GET)
	@ResponseBody
	public String sendSMS(Model model, MemberDTO memberDTO) throws Exception {
		
        Random random = new Random();
        int checkNum = random.nextInt(8889) + 1111;
        logger.info("휴대폰 인증번호 " + checkNum);
		
		String api_key = "NCS7SQTOYYYEX62T";
	    String api_secret = "JQDGRHQ2XBFALGJTBBSHCU33UIT3G7GA";
	    Message coolsms = new Message(api_key, api_secret);

        String receiverPhoneNum = memberDTO.getMphonenum();
        String certificationNum2 = ""+ checkNum;
        
        HashMap<String, String> params = new HashMap<String, String>();
        params.put("to", receiverPhoneNum);    // 수신전화번호
        params.put("from", "01092946703");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
        params.put("type", "SMS");
        params.put("text", "ABC_MART 인증번호는" + "["+certificationNum2+"]" + "입니다.");
        
        try {
           
        	JSONObject obj = (JSONObject) coolsms.send(params);
            System.err.println(obj.toString());
        
        } catch (CoolsmsException e) {
            
        	System.err.println(e.getMessage());
            System.err.println(e.getCode());
            
        }
        
		return certificationNum2;
	}

	
	// 회원 - 비밀번호 찾기
	@RequestMapping(value = "/MemberPwSearch", method = RequestMethod.GET)
	
	public String memberPwSearch() {

		return "./member/member_pw_search";
	}

	
	// 회원 - 비밀번호 이메일로 찾기 뷰
	@RequestMapping(value = "/MemberPwSearchAsEMailView", method = RequestMethod.GET)

	public String memberPwSearchAsEMailView(Model model, MemberDTO memberDTO) {

			String searchResult = "none";
			String mname = memberDTO.getMname();
			String memail = memberDTO.getMemail();
			
			Random random =new Random();

			StringBuffer buffer =new StringBuffer();

			for(int i=0;i<10;i++){

			    if(random.nextBoolean()){

			    	buffer.append((char)((int)(random.nextInt(26))+97));

			    }else{

			    	buffer.append((random.nextInt(10)));
			        
			    }

			}
			
			String pwCode = buffer.toString();
			
			System.err.println("임시 비밀번호 - " + pwCode);

			if (memberService.memberPwSearchAsEmail(memberDTO) != null) {

				memberDTO.setMpw(pwCode);
				memberService.memberUpdateAsEmail(memberDTO);

				if (memberDTO.getMname() != null && memberDTO.getMemail() != null) {

					if (mname.equals(memberDTO.getMname()) && memail.equals(memberDTO.getMemail())) {

						searchResult = "available";
						model.addAttribute("searchResult", searchResult);
						model.addAttribute("pwCode", pwCode);
						model.addAttribute("memberDTO", memberService.memberPwSearchAsEmail(memberDTO));
						return "./member/member_pw_search_view";

					} else {

						model.addAttribute("searchResult", searchResult);
						return "./member/member_pw_search_view";

					}

				} else {

					model.addAttribute("searchResult", searchResult);
					return "./member/member_pw_search_view";

				}

			} else {

				model.addAttribute("searchResult", searchResult);
				return "./member/member_pw_search_view";

			}

	}
	
	// 회원 - 비밀번호 휴대폰 번호로 찾기 뷰
		@RequestMapping(value = "/MemberPwSearchAsPhoneNumView", method = RequestMethod.GET)

		public String memberPwSearchAsPhoneNumView(Model model, MemberDTO memberDTO) {

				String searchResult = "none";
				String mname = memberDTO.getMname();
				String mphonenum = memberDTO.getMphonenum();
				
				Random random =new Random();

				StringBuffer buffer =new StringBuffer();

				for(int i=0;i<10;i++){

				    if(random.nextBoolean()){

				    	buffer.append((char)((int)(random.nextInt(26))+97));

				    }else{

				    	buffer.append((random.nextInt(10)));
				        
				    }

				}
				
				String pwCode = buffer.toString();
				
				System.err.println("임시 비밀번호 - " + pwCode);

				if (memberService.memberPwSearchAsPhoneNum(memberDTO) != null) {

					memberDTO.setMpw(pwCode);
					memberService.memberUpdateAsPhoneNum(memberDTO);

					if (memberDTO.getMname() != null && memberDTO.getMphonenum() != null) {

						if (mname.equals(memberDTO.getMname()) && mphonenum.equals(memberDTO.getMphonenum())) {

							searchResult = "available";
							model.addAttribute("searchResult", searchResult);
							model.addAttribute("pwCode", pwCode);
							model.addAttribute("memberDTO", memberService.memberPwSearchAsPhoneNum(memberDTO));
							return "./member/member_pw_search_view";

						} else {

							model.addAttribute("searchResult", searchResult);
							return "./member/member_pw_search_view";

						}

					} else {

						model.addAttribute("searchResult", searchResult);
						return "./member/member_pw_search_view";

					}

				} else {

					model.addAttribute("searchResult", searchResult);
					return "./member/member_pw_search_view";

				}

		}
	
}
