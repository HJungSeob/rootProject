package root.team.com.controller;

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
	SellerService sJoin;

	///////////////////////////////////////////////////////////////

	@GetMapping("/join.do")
	public String join() {
		return "seller/user/join";
	}

	@PostMapping("/joinProcess.do")
	public String joinProcess(SellerVO sellerVO) {
		String viewPage = "seller/user/join";

		if (sJoin.join(sellerVO) == 1) {
			viewPage = "redirect:/index.do";
		}

		return viewPage;
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
