package root.team.com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.Setter;
import root.team.com.service.buyer.BuyerService;
import root.team.com.vo.BuyerVO;

@Controller
@RequestMapping("/buyer")
public class buyerController {
	
	@Setter(onMethod_ = { @Autowired })
	BuyerService bJoin, bLogin;

	@GetMapping("/buyerLogin.do")
	public String buyerLogin() {
		return "buyer/user/buyerLogin";
	}
	
	@GetMapping("/buyerJoin.do")
	public String buyerJoin() {
		return "buyer/user/buyerJoin";
	}
	
	@PostMapping("/buyerJoinProcess.do")
	public String joinProcess(BuyerVO buyerVO) {
		String viewPage = "buyer/user/buyerJoin";

		if (bJoin.join(buyerVO) == 1) {
			if (bJoin.infoState(bJoin.getB_idx(buyerVO.getB_email())) == 1) {
				viewPage = "redirect:/index.do";
			}
		}

		return viewPage;
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
