package root.team.com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.Setter;
import root.team.com.service.buyer.BuyerService;
import root.team.com.vo.BuyerVO;
import root.team.com.vo.SellerVO;

@Controller
@RequestMapping("/buyer")
public class buyerController {
	
	@Setter(onMethod_ = { @Autowired })
	BuyerService bJoin, bLogin;
	
	@GetMapping("/buyerJoin.do")
	public String buyerJoin() {
		return "buyer/user/buyerJoin";
	}
	
	@PostMapping("/buyerJoinProcess.do")
	public String joinProcess(BuyerVO buyerVO) {
		String viewPage = "buyer/user/buyerJoin";

		if (bJoin.join(buyerVO) == 1) {
			if (bJoin.infoState(buyerVO.getB_email()) == 1) {
				viewPage = "redirect:/index.do";
			}
		}

		return viewPage;
	}
	
	@GetMapping("/buyerLogin.do")
	public String buyerLogin() {
		return "buyer/user/buyerLogin";
	}
	
	@PostMapping("/buyerLoginProcess.do")
	public String loginProcess(String b_email, String b_pw, HttpServletRequest request) {
		String viewPage = "buyer/user/buyerLogin";

		BuyerVO buyerVO = bLogin.login(b_email, b_pw);
		if (buyerVO != null) {
			HttpSession session = request.getSession();
			session.setAttribute("buyer", buyerVO);
			viewPage = "redirect:/index.do";
		}
		
		return viewPage;
	}
	
	@GetMapping("/buyerLogout.do")
	public String logout(HttpServletRequest request) {
		// 세션객체를 초기화하는 것으로 로그아웃 처리
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/index.do";// 메인 페이지 재요청
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
