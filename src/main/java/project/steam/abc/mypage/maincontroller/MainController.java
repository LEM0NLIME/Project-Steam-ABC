package project.steam.abc.mypage.maincontroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	
	@RequestMapping(value = "/MyPageMain", method = RequestMethod.GET)
	public String main() {
		return "./mypage/mypage_main";
	}

}
