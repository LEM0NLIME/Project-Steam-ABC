package project.steam.abc.member.login;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import project.steam.abc.member.dto.MemberDTO;
import project.steam.abc.member.service.MemberService;

@Controller

public class MemberLogInController {
	
		@Autowired
		private MemberService memberService;
		
		//로그인
		@RequestMapping(value = "/MemberLogIn" , method = RequestMethod.GET)

		public String memberLogIn(Model model) {
				
			return "./member/member_login";
		}
		
		//로그인 체크 POST
	  	@RequestMapping(value = "/MemberLogInCheck" , method = RequestMethod.POST)

		public String memberLogInCheck(Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response, MemberDTO memberDTO) {

	  		boolean check = true;
	  		
	  		String mid = request.getParameter("mid");
	  		String mpw = request.getParameter("mpw");
	  		String cookieID = request.getParameter("cookieID");
	  		String saveID = request.getParameter("saveID");
	  		
	  		memberDTO = memberService.memberInquiryDetail(mid);
	  		
	  		if(memberDTO == null) {
	  		
	  			check = false;

				model.addAttribute("check", check);
					
				return "./member/member_login_check";
	  			
	  		}
	  		
	  		model.addAttribute("memberDTO", memberDTO);
	  		
	  		if(mid.equals("admin") & mpw.equals(memberDTO.getMpw())) {
				
			session.setAttribute("sessionID", mid);
			
			model.addAttribute("check", check);
			
			if(cookieID != null) {
				
				Cookie cookie = new Cookie("cookieID", mid);
				cookie.setMaxAge(60 * 60 * 24);
				cookie.setPath("/");
					
				response.addCookie(cookie);

				model.addAttribute("check", check);
				
			}
			
			if(saveID != null) {
				
			Cookie cookie = new Cookie("saveID", mid);
			cookie.setMaxAge(60 * 60 * 24);
			cookie.setPath("/");
				
			response.addCookie(cookie);

			model.addAttribute("check", check);
			
			}
			
			return "./member/member_login_check";
				
			}else if(mid.equals(memberDTO.getMid()) && mpw.equals(memberDTO.getMpw())){
			
			session.setAttribute("sessionID", mid);
			
			model.addAttribute("memberDTO", memberDTO);
			model.addAttribute("check", check);
			
			if(cookieID != null) {
				
				Cookie cookie = new Cookie("cookieID", mid);
				cookie.setMaxAge(60 * 60 * 24);
				cookie.setPath("/");
					
				response.addCookie(cookie);

				model.addAttribute("check", check);
				
			}
			
			if(saveID != null) {
				
			Cookie cookie = new Cookie("saveID", mid);
			cookie.setMaxAge(60 * 60 * 24);
			cookie.setPath("/");
				
			response.addCookie(cookie);

			model.addAttribute("check", check);
			
			}
			
			return "./member/member_login_check";
			
			}else {
					
			check = false;

			model.addAttribute("check", check);
				
			return "./member/member_login_check";
				
			}

		}
	  	
	  	//로그아웃
	  	@RequestMapping(value = "/MemberLogOut", method = RequestMethod.GET)

		public String memberLogOut(Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response, MemberDTO memberDTO) {
			
	  		session.invalidate();

	  		Cookie[] cookies = request.getCookies();
	  		
	  		if(cookies != null) {
				
				for(Cookie cookie : cookies) {

					if(cookie.getName().equals("saveID")) {
						
						cookie.setMaxAge(0);
						
						cookie.setPath("/");
						
						response.addCookie(cookie);
						
					}
					
				}
				
	  		}

	  		return "redirect:/abc_main.jsp";
	  	}
	
	  	
}
