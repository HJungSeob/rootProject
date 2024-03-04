package root.team.com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.Setter;
import root.team.com.service.global.GlobalService;
import root.team.com.service.seller.SellerService;
import root.team.com.vo.SellerVO;

@Controller
@RequestMapping("/seller")
public class SellerController {

	@Setter(onMethod_ = { @Autowired })
	SellerService sJoin, sLogin, sUpdate, sInfoUpdate, sCancel, sCheck;

	@Setter(onMethod_ = { @Autowired })
	GlobalService gDateUpdate, gFileNameUpdate;

	///////////////////////////////////////////////////////////////

	@GetMapping("/sellerJoin.do")
	public String sellerJoin() {

		return "seller/user/sellerJoin";
	}

	@PostMapping("/sellerJoinProcess.do")
	public String sellerJoinProcess(SellerVO sellerVO) {
		String viewPage = "seller/user/sellerJoin";

		if (sJoin.join(sellerVO) == 1) {
			if (sJoin.infoState(sellerVO) == 1) {
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

	@PostMapping("/sellerUpdateProcess.do")
	public String sellerUpdateProcess(SellerVO sellerVO, HttpServletRequest request) {
		String viewPage = "seller/user/sellerUpdate";

		SellerVO newVO = sUpdate.update(sellerVO);

		if (newVO != null) {
			newVO.setS_lastlogindate(gDateUpdate.dateUpdate(newVO.getS_lastlogindate()));
			newVO.setS_pwmodifydate(gDateUpdate.dateUpdate(newVO.getS_pwmodifydate()));
			newVO.setS_modifydate(gDateUpdate.dateUpdate(newVO.getS_modifydate()));
			newVO.setS_regdate(gDateUpdate.dateUpdate(newVO.getS_regdate()));

			HttpSession session = request.getSession();
			session.removeAttribute("seller");
			session.setAttribute("seller", newVO);

			viewPage = "redirect:/seller/sellerUpdate.do";
		}

		return viewPage;
	}
	
	@PostMapping("/sellerInfoUpdateProcess.do")
	public String sellerInfoUpdateProcess(SellerVO sellerVO, HttpServletRequest request) {
		String viewPage = "seller/user/sellerUpdate";
		String saveDirectory = request.getServletContext().getRealPath("resources/uploads/");
		
		try {
			sellerVO.setS_profile(gFileNameUpdate.fileNameUpdate(sellerVO.getS_tempprofile(), saveDirectory));
		
		} catch (NullPointerException e) {
		}
		
		SellerVO newVO = sInfoUpdate.update(sellerVO);
		
		if (newVO != null) {
			newVO.setS_lastlogindate(gDateUpdate.dateUpdate(newVO.getS_lastlogindate()));
			newVO.setS_pwmodifydate(gDateUpdate.dateUpdate(newVO.getS_pwmodifydate()));
			newVO.setS_modifydate(gDateUpdate.dateUpdate(newVO.getS_modifydate()));
			newVO.setS_regdate(gDateUpdate.dateUpdate(newVO.getS_regdate()));

			HttpSession session = request.getSession();
			session.removeAttribute("seller");
			session.setAttribute("seller", newVO);

			viewPage = "redirect:/seller/sellerUpdate.do";
		}
		
		return viewPage;
	}

	@GetMapping("/sellerCancelProcess.do")
	public String sellerCancelProcess(HttpServletRequest request) {
		String viewPage = "seller/user/sellerUpdate";

		HttpSession session = request.getSession();
		SellerVO vo = (SellerVO) session.getAttribute("seller");
		int s_idx = vo.getS_idx();

		if (sCancel.cancel(s_idx) == 2) {
			session.invalidate();
			viewPage = "redirect:/index.do";
		}

		return viewPage;
	}
	
	@GetMapping("/sellerFindPw.do")
	public String sellerFindPw() {
		return "seller/user/sellerFindPw";
	}
	
	@PostMapping("/telCheckProcess.do")
	@ResponseBody
	public int telCheckProcess(@RequestParam("s_tel") String s_tel) {
		return sCheck.telCheck(s_tel);
	}
	
	@PostMapping("/businessnumCheckProcess.do")
	@ResponseBody
	public int businessnumCheckProcess(@RequestParam("s_businessnum") String s_businessnum) {
		return sCheck.businessnumCheck(s_businessnum);
	}
	
	@PostMapping("/emailCheckProcess.do")
	@ResponseBody
	public int emailCheckProcess(@RequestParam("s_email") String s_email) {
		return sCheck.emailCheck(s_email);
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
