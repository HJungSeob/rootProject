package root.team.com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.Setter;
import root.team.com.service.buyer.BuyerService;
import root.team.com.service.global.GlobalService;
import root.team.com.vo.AddressVO;
import root.team.com.vo.BuyerVO;

@Controller
@RequestMapping("/buyer")
public class BuyerController {

	@Setter(onMethod_ = { @Autowired })
	BuyerService bJoin, bLogin, bUpdate, bGetAddress, bInsertAddress, bInsertContact, bInfoUpdate, bCancel, bCheck, bFind;

	@Setter(onMethod_ = { @Autowired })
	GlobalService gDateUpdate, gFileNameUpdate;

	@GetMapping("/buyerJoin.do")
	public String buyerJoin() {
		return "buyer/user/buyerJoin";
	}

	@PostMapping("/buyerJoinProcess.do")
	public String buyerJoinProcess(BuyerVO buyerVO) {
		String viewPage = "buyer/user/buyerJoin";
		
		if (bJoin.join(buyerVO) == 1) {
			if (bJoin.infoState(buyerVO) == 1) {
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
	public String buyerLoginProcess(String b_email, String b_pw, HttpServletRequest request) {
		String viewPage = "buyer/user/buyerLogin";

		BuyerVO buyerVO = bLogin.login(b_email, b_pw);

		if (buyerVO != null) {
			buyerVO.setB_lastlogindate(gDateUpdate.dateUpdate(buyerVO.getB_lastlogindate()));
			buyerVO.setB_pwmodifydate(gDateUpdate.dateUpdate(buyerVO.getB_pwmodifydate()));
			buyerVO.setB_modifydate(gDateUpdate.dateUpdate(buyerVO.getB_modifydate()));
			buyerVO.setB_regdate(gDateUpdate.dateUpdate(buyerVO.getB_regdate()));

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
	public String buyerServiceInfo(int b_idx, Model model) {

		AddressVO address = bGetAddress.getAddress(b_idx);
		model.addAttribute("address", address);
		return "buyer/user/buyerServiceInfo";
	}

	@GetMapping("/buyerUpdatePage.do")
	public String buyerUpdatePage() {
		return "buyer/user/buyerUpdatePage";
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

	@PostMapping("/buyerUpdateProcess.do")
	public String buyerUpdateProcess(BuyerVO buyerVO, HttpServletRequest request) {
		String viewPage = null;
		if ((buyerVO.getB_firstname() != null && buyerVO.getB_lastname() != null) || (buyerVO.getB_birth() != null)) {
			viewPage = "buyer/user/buyerUpdatePage1";
		} else if (buyerVO.getB_tel() != null || (buyerVO.getB_pw() != null)) {
			viewPage = "buyer/user/buyerUpdatePage2";
		}

		BuyerVO newVO = bUpdate.update(buyerVO);

		if (newVO != null) {
			newVO.setB_lastlogindate(gDateUpdate.dateUpdate(newVO.getB_lastlogindate()));
			newVO.setB_pwmodifydate(gDateUpdate.dateUpdate(newVO.getB_pwmodifydate()));
			newVO.setB_modifydate(gDateUpdate.dateUpdate(newVO.getB_modifydate()));
			newVO.setB_regdate(gDateUpdate.dateUpdate(newVO.getB_regdate()));
			HttpSession session = request.getSession();
			session.removeAttribute("buyer");
			session.setAttribute("buyer", newVO);

			if ((buyerVO.getB_firstname() != null && buyerVO.getB_lastname() != null)
					|| (buyerVO.getB_birth() != null)) {
				viewPage = "redirect:/buyer/buyerUpdatePage1.do";
			} else if (buyerVO.getB_tel() != null || (buyerVO.getB_pw() != null)) {
				viewPage = "redirect:/buyer/buyerUpdatePage2.do";
			}
		}
		return viewPage;
	}

	@PostMapping("/buyerInsertAddressProcess.do")
	public String buyerInsertAddressProcess(AddressVO addressVO, RedirectAttributes ra) {
		String viewPage = "buyer/user/buyerServiceInfo";

		if (bInsertAddress.insertAddress(addressVO) == 1) {
			ra.addAttribute("b_idx", addressVO.getB_idx());
			viewPage = "redirect:/buyer/buyerServiceInfo.do";
		}
		return viewPage;
	}

	@PostMapping("/buyerInsertContactProcess.do")
	public String buyerInsertContactProcess(AddressVO addressVO, RedirectAttributes ra, Model model) {
		String viewPage = "buyer/user/buyerServiceInfo";

		AddressVO newVO = bInsertContact.insertContact(addressVO);

		model.addAttribute("address", newVO);

		ra.addAttribute("b_idx", addressVO.getB_idx());
		viewPage = "redirect:/buyer/buyerServiceInfo.do";

		return viewPage;
	}

	@PostMapping("/buyerInfoUpdateProcess.do")
	public String buyerInfoUpdateProcess(BuyerVO buyerVO, HttpServletRequest request) {
		String viewPage = null;

		if ((buyerVO.getB_tempprofile() != null) || (buyerVO.getB_nickname() != null)) {
			viewPage = "buyer/user/buyerUpdatePage";
		} else if (buyerVO.getB_gender() != null) {
			viewPage = "buyer/user/buyerUpdatePage1";
		}

		String saveDirectory = request.getServletContext().getRealPath("resources/uploads/");

		try {
			buyerVO.setB_profile(gFileNameUpdate.fileNameUpdate(buyerVO.getB_tempprofile(), saveDirectory));

		} catch (NullPointerException e) {
		}

		BuyerVO newVO = bInfoUpdate.update(buyerVO);

		if (newVO != null) {
			newVO.setB_lastlogindate(gDateUpdate.dateUpdate(newVO.getB_lastlogindate()));
			newVO.setB_pwmodifydate(gDateUpdate.dateUpdate(newVO.getB_pwmodifydate()));
			newVO.setB_modifydate(gDateUpdate.dateUpdate(newVO.getB_modifydate()));
			newVO.setB_regdate(gDateUpdate.dateUpdate(newVO.getB_regdate()));

			HttpSession session = request.getSession();
			session.removeAttribute("buyer");
			session.setAttribute("buyer", newVO);

			if ((buyerVO.getB_tempprofile() != null) || (buyerVO.getB_nickname() != null)) {
				viewPage = "redirect:/buyer/buyerUpdatePage.do";
			} else if (buyerVO.getB_gender() != null) {
				viewPage = "redirect:/buyer/buyerUpdatePage1.do";
			}
		}
		return viewPage;
	}

	@GetMapping("/buyerCancelProcess.do")
	public String buyerCancelProcess(HttpServletRequest request) {
		String viewPage = "buyer/user/buyerUpdatePage";

		HttpSession session = request.getSession();
		BuyerVO vo = (BuyerVO) session.getAttribute("buyer");
		int b_idx = vo.getB_idx();

		if (bCancel.cancel(b_idx) == 2) {

			session.invalidate();
			viewPage = "redirect:/index.do";
		}

		return viewPage;
	}

	@PostMapping("/emailCheckProcess.do")
	@ResponseBody
	public int emailCheckProcess(@RequestParam("b_email") String b_email) {
		return bCheck.emailCheck(b_email);
	}

	@PostMapping("/telCheckProcess.do")
	@ResponseBody
	public int telCheckProcess(@RequestParam("b_tel") String b_tel) {
		return bCheck.telCheck(b_tel);
	}
	
	@GetMapping("/findPw.do")
	public String findPw() {
		return "buyer/user/buyerFindPw";
	}
	
	@PostMapping("/findPwProcess.do")
	@ResponseBody
	public void findPwProcess(@ModelAttribute BuyerVO buyerVO, HttpServletResponse response) throws Exception{
		System.out.println(buyerVO.getB_email());
		System.out.println(buyerVO.getB_tel());
		bFind.findPw(response, buyerVO);
	}
}
