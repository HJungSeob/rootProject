package root.team.com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.Setter;
import root.team.com.service.seller.SellerService;
import root.team.com.vo.SellerVO;

@Controller
@RequestMapping("/seller")
public class SellerController {

	@Setter(onMethod_ = { @Autowired })
	SellerService sJoin, sLogin;

	///////////////////////////////////////////////////////////////

	@GetMapping("/join.do")
	public String join() {
		return "seller/user/join";
	}

	@PostMapping("/joinProcess.do")
	public String joinProcess(SellerVO sellerVO) {
		String viewPage = "seller/user/join";

		if (sJoin.join(sellerVO) == 1) {
			if (sJoin.infoState(sJoin.getS_idx(sellerVO.getS_businessnum())) == 1) {
				viewPage = "redirect:/index.do";
			}
		}

		return viewPage;
	}

	@GetMapping("/login.do")
	public String login() {
		return "seller/user/login";
	}

	@PostMapping("/loginProcess.do")
	public String loginProcess(String s_businessnum, String s_pw, HttpServletRequest request) {
		String viewPage = "seller/user/login";

		SellerVO sellerVO = sLogin.login(s_businessnum, s_pw);

		if (sellerVO != null) {
			System.out.println(sellerVO.getS_storename());
			HttpSession session = request.getSession();
			session.setAttribute("seller", sellerVO);
			viewPage = "redirect:/seller/dashBoard.do";
		}
		return viewPage;
	}
	
	@GetMapping("/logout.do")
	public String logout(HttpServletRequest request) {
		// 세션객체를 초기화하는 것으로 로그아웃 처리
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/index.do";// 메인 페이지 재요청
	}

	///////////////////////////////////////////////////////////////

	@GetMapping("/dashBoard.do")
	public String dashBoard() {
		return "seller/dashBoard";
	}

	@GetMapping("/delivery.do")
	public String delivery() {
		return "seller/service/delivery";
	}

	@GetMapping("/inquiry.do")
	public String inquiry() {
		return "seller/service/inquiry";
	}

	@GetMapping("/review.do")
	public String review() {
		return "seller/service/review";
	}

	@GetMapping("/sales.do")
	public String sales() {
		return "seller/service/sales";
	}

	@GetMapping("/settlement.do")
	public String settlement() {
		return "seller/service/settlement";
	}

	@GetMapping("/store.do")
	public String store() {
		return "seller/service/store";
	}

	@GetMapping("/viewEdit.do")
	public String viewEdit() {
		return "seller/service/viewEdit";
	}
}
