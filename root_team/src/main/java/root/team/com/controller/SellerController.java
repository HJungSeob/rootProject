package root.team.com.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.Setter;
import root.team.com.common.PageNav;
import root.team.com.service.global.GlobalService;
import root.team.com.service.seller.SellerService;
import root.team.com.vo.ItemVO;
import root.team.com.vo.OrderStateVO;
import root.team.com.vo.ReviewVO;
import root.team.com.vo.SearchVO;
import root.team.com.vo.SellerVO;

@Controller
@RequestMapping("/seller")
public class SellerController {

	@Setter(onMethod_ = { @Autowired })
	SellerService sJoin, sLogin, sUpdate, sInfoUpdate, sCancel, sCheck, sFind, sJoinEmail, sList, sTotalCount, sPage;

	@Setter(onMethod_ = { @Autowired })
	GlobalService gDateUpdate, gFileNameUpdate;

	@Setter(onMethod_ = { @Autowired })
	PageNav pageNav;

	///////////////////////////////////////////////////////////////

	@GetMapping("/sellerJoin.do")
	public String sellerJoin() {

		return "seller/user/sellerJoin";
	}

	@PostMapping("/sellerJoinProcess.do")
	public String sellerJoinProcess(HttpServletRequest request, SellerVO sellerVO) {
		String viewPage = "seller/user/sellerJoin";

		if (sJoin.join(sellerVO) == 1) {
			if (sJoin.infoState(sellerVO) == 1) {
				viewPage = "redirect:/seller/sellerVerifyEmail.do";
				HttpSession session = request.getSession();
				session.setAttribute("s_email", sellerVO.getS_email());
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

	@PostMapping("/storenameCheckProcess.do")
	@ResponseBody
	public int storenameCheckProcess(String s_storename) {
		return sCheck.storenameCheck(s_storename);
	}
	
	@PostMapping("/telCheckProcess.do")
	@ResponseBody
	public int telCheckProcess(String s_tel) {
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

	@GetMapping("/findPw.do")
	public String findPw() {
		return "seller/user/sellerFindPw";
	}

	@PostMapping("/findPwProcess.do")
	@ResponseBody
	public void findPwProcess(@ModelAttribute SellerVO sellerVO, HttpServletResponse response) throws Exception {
		sFind.findPw(response, sellerVO);
	}

	@PostMapping("/passwordCheckProcess.do")
	@ResponseBody
	public int passwordCheckProcess(int s_idx, String s_pw) {
		return sCheck.passwordCheck(s_idx, s_pw);
	}

	@PostMapping("/joinEmailProcess.do")
	@ResponseBody
	public String joinEmailProcess(String s_email) {
		return sJoinEmail.joinEmail(s_email);
	}

	@GetMapping("/sellerVerifyEmail.do")
	public String sellerVerifyEmail() {
		return "seller/user/sellerVerifyEmail";
	}

	@PostMapping("/sellerVerifyEmailProcess.do")
	@ResponseBody
	public int sellerVerifyEmailProcess(String s_email) {
		return sUpdate.verifyEmail(s_email);
	}

	@PostMapping("/getItemProcess.do")
	@ResponseBody
	public List<ItemVO> getItemProcess(Model model, int s_idx) {
		List<ItemVO> newVO = sList.getItem(s_idx);
		model.addAttribute("item", newVO);

		return newVO;
	}
	
	@PostMapping("/getOrderProcess.do")
	@ResponseBody
	public List<OrderStateVO> getOrderProcess(Model model, int s_idx) {
		List<OrderStateVO> newVO = sList.getOrder(s_idx);
		model.addAttribute("order", newVO);

		return newVO;
	}

	///////////////////////////////////////////////////////////////

	@GetMapping("/dashBoard.do")
	public String dashBoard() {
		return "seller/dashBoard";
	}

	@GetMapping("/viewEdit.do")
	public String viewEdit(@ModelAttribute("sVO") SearchVO searchVO, String sDate, String eDate, Model model) {
		if (searchVO.getPageNum() == 0) {
			searchVO.setPageNum(1);
		}

		// 상품 조회/수정을 처음 선택한 경우 사용자단에서 넘어오는 값이 없기 때문에
		// SearchVO 객체에서 Mapper의 조건으로 사용되는 필드 중 String형인 필드의 값을
		// 빈 문자열로 세팅해줌

		if (searchVO.getItemNum() == null) {
			searchVO.setItemNum("");
		}

		if (searchVO.getItemName() == null) {
			searchVO.setItemName("");
		}

		if (sDate != null && eDate != null) { // 시작일자와 마침일자에 날짜값이 입력된 경우
			SimpleDateFormat dtFormat = new SimpleDateFormat("yyyy-MM-dd");
			try {
				// 문자열로 넘어온 날짜값을 Date객체로 변환해서 searchVo에 세팅함
				Date startDate = dtFormat.parse(sDate);
				Date endDate = dtFormat.parse(eDate);

				searchVO.setStartDate(startDate);
				searchVO.setEndDate(endDate);

			} catch (ParseException e) {
			}
		}

		List<ItemVO> itemList = sList.getItems(searchVO);
		model.addAttribute("itemList", itemList);

		pageNav.setTotalRows(sTotalCount.getItemTotalCount(searchVO));
		pageNav = sPage.setPageNav(pageNav, searchVO.getPageNum(), searchVO.getPageBlock());
		model.addAttribute("pageNav", pageNav);

		return "seller/service/viewEdit";
	}

	@GetMapping("/sales.do")
	public String sales(@ModelAttribute("sVO") SearchVO searchVO, String sDate, String eDate, Model model) {
		if (searchVO.getPageNum() == 0) {
			searchVO.setPageNum(1);
		}

		if (searchVO.getOrderNum() == null) {
			searchVO.setOrderNum("");
		}

		if (searchVO.getOrderNickname() == null) {
			searchVO.setOrderNickname("");
		}
		
		if (sDate != null && eDate != null) {
			SimpleDateFormat dtFormat = new SimpleDateFormat("yyyy-MM-dd");
			
			try {
				Date startDate = dtFormat.parse(sDate);
				Date endDate = dtFormat.parse(eDate);

				searchVO.setStartDate(startDate);
				searchVO.setEndDate(endDate);

			} catch (ParseException e) {
			}
		}
		
		List<OrderStateVO> orderList = sList.getOrders(searchVO);
		model.addAttribute("orderList", orderList);

		pageNav.setTotalRows(sTotalCount.getOrderTotalCount(searchVO));
		pageNav = sPage.setPageNav(pageNav, searchVO.getPageNum(), searchVO.getPageBlock());
		model.addAttribute("pageNav", pageNav);
		
		return "seller/service/sales";
	}
	
	@GetMapping("/review.do")
	public String review(@ModelAttribute("sVO") SearchVO searchVO, String sDate, String eDate, Model model) {
		if (searchVO.getPageNum() == 0) {
			searchVO.setPageNum(1);
		}

		if (searchVO.getItemNum() == null) {
			searchVO.setItemNum("");
		}

		if (searchVO.getBuyerNickname() == null) {
			searchVO.setBuyerNickname("");
		}
		
		if (sDate != null && eDate != null) {
			SimpleDateFormat dtFormat = new SimpleDateFormat("yyyy-MM-dd");
			
			try {
				Date startDate = dtFormat.parse(sDate);
				Date endDate = dtFormat.parse(eDate);

				searchVO.setStartDate(startDate);
				searchVO.setEndDate(endDate);

			} catch (ParseException e) {
			}
		}
		
		List<ReviewVO> reviewList = sList.getReviews(searchVO);
		model.addAttribute("reviewList", reviewList);

		pageNav.setTotalRows(sTotalCount.getReviewTotalCount(searchVO));
		pageNav = sPage.setPageNav(pageNav, searchVO.getPageNum(), searchVO.getPageBlock());
		model.addAttribute("pageNav", pageNav);
		
		return "seller/service/review";
	}
	
	@PostMapping("/updateOrderStateProcess.do")
	@ResponseBody
	public int updateOrderStateProcess(@RequestBody OrderStateVO orderStateVO) {
		return sUpdate.updateOrderState(orderStateVO);
	}
	
	@PostMapping("/updateItemStateProcess.do")
	@ResponseBody
	public int updateItemStateProcess(@RequestBody ItemVO itemVO) {
		return sUpdate.updateItemState(itemVO);
	}

	@GetMapping("/delivery.do")
	public String delivery() {
		return "seller/service/delivery";
	}

	@GetMapping("/inquiry.do")
	public String inquiry() {
		return "seller/service/inquiry";
	}

	@GetMapping("/settlement.do")
	public String settlement() {
		return "seller/service/settlement";
	}

	@GetMapping("/store.do")
	public String store() {
		return "seller/service/store";
	}

}
