package root.team.com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	@GetMapping("/")
	public String home() {
		return "index";
	}

	@GetMapping("/index.do")
	public String home2() {
		return "index";
	}

}
