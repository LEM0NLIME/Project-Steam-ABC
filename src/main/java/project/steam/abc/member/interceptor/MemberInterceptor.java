package project.steam.abc.member.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class MemberInterceptor extends HandlerInterceptorAdapter{

	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		System.err.println("인터셉터 정상 작동 확인");
		
		HttpSession session = request.getSession();
		
		Cookie[] cookies = request.getCookies();

		if(cookies != null) {
			
			for(Cookie cookie : cookies) {
				
				if(cookie.getName().equals("saveID")) {
					
					String id = cookie.getValue();
					
					session.setAttribute("sessionID", id);
					
				}
			}
		}
		
		return true;

	}
}

