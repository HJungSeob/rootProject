package root.team.com.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/buyer")
public class buyerController {

	@GetMapping("/buyerLogin.do")
	public String buyerLogin() {
		return "buyer/user/buyerLogin";
	}
	
	@GetMapping("/buyerJoin.do")
	public String buyerJoin() {
		return "buyer/user/buyerJoin";
	}
	
	@GetMapping("/buyerServiceInfo.do")
	public String buyerServiceInfo() {
		return "buyer/user/buyerServiceInfo";
	}
	
	@GetMapping("/buyerUpdatePage1.do")
	public String buyerUpdatePage1() {
		return "buyer/user/buyerUpdatePage1";
	}
	
	@GetMapping("/buyerUpdatePage2.do")
	public String buyerUpdatePage2() {
		return "buyer/user/buyerUpdatePage2";
	}
	
	@GetMapping("/buyerUpdatePage3.do")
	public String buyerUpdatePage3() {
		return "buyer/user/buyerUpdatePage3";
	}
}
