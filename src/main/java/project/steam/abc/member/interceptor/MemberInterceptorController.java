package project.steam.abc.member.interceptor;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberInterceptorController {

	private static final Logger logger = LoggerFactory.getLogger(MemberInterceptorController.class);

	@RequestMapping(value = "/interceptor", method = RequestMethod.GET)
	public boolean preInterceptor(Model model) {
		
	logger.info("interceptor 실행");
	
	return true;
	
	}
	
}
