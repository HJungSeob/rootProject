package root.team.com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.Setter;
import root.team.com.service.global.GlobalService;
import root.team.com.service.seller.SellerService;
import root.team.com.vo.SellerVO;

@Controller
@RequestMapping("/seller")
public class SellerController {

	@Setter(onMethod_ = { @Autowired })
	SellerService sJoin, sLogin;
	
	@Setter(onMethod_ = { @Autowired })
	GlobalService gDateUpdate;

	///////////////////////////////////////////////////////////////

	@GetMapping("/sellerJoin.do")
	public String sellerJoin() {
		
		return "seller/user/sellerJoin";
	}

	@PostMapping("/sellerJoinProcess.do")
	public String sellerJoinProcess(SellerVO sellerVO) {
		String viewPage = "seller/user/sellerJoin";

		if (sJoin.join(sellerVO) == 1) {
			if (sJoin.infoState(sJoin.getS_idx(sellerVO.getS_businessnum())) == 1) {
				viewPage = "redirect:/index.do";
			}
		}
		
		return viewPage;
	}

	@GetMapping("/sellerLogin.do")
	public String sellerLogin() {
		
		return "seller/user/sellerLogin";
	}

	@PostMapping("/sellerLoginProcess.do")
	public String sellerLoginProcess(String s_businessnum, String s_pw, HttpServletRequest request) {
		String viewPage = "seller/user/sellerLogin";

		SellerVO sellerVO = sLogin.login(s_businessnum, s_pw);
		
		if (sellerVO != null) {
			sellerVO.setS_lastlogindate(gDateUpdate.dateUpdate(sellerVO.getS_lastlogindate()));
			sellerVO.setS_pwmodifydate(gDateUpdate.dateUpdate(sellerVO.getS_pwmodifydate()));
			sellerVO.setS_modifydate(gDateUpdate.dateUpdate(sellerVO.getS_modifydate()));
			sellerVO.setS_regdate(gDateUpdate.dateUpdate(sellerVO.getS_regdate()));
			
			HttpSession session = request.getSession();
			session.setAttribute("seller", sellerVO);
			
			viewPage = "redirect:/seller/dashBoard.do";
		}
		
		return viewPage;
	}
	
	@GetMapping("/sellerLogout.do")
	public String sellerLogout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "redirect:/index.do";
	}
	
	@GetMapping("/sellerUpdate.do")
	public String sellerUpdate() {
		return "seller/user/sellerUpdate";
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
