package root.team.com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.Setter;
import root.team.com.service.buyer.BuyerService2;
import root.team.com.service.global.GlobalService;
import root.team.com.vo.CartVO;

@Controller
@RequestMapping("/buyer2")
public class BuyerController2 {

	@Setter(onMethod_ = { @Autowired })
	BuyerService2 bCart;

	@Setter(onMethod_ = { @Autowired })
	GlobalService gDateUpdate, gFileNameUpdate;

	
		
	//////////////////////////////////////////////////////////////////////////////////////////////
	
	@PostMapping("/cart.do")
	@ResponseBody
	public int cart(CartVO cartVO) {
		return bCart.cart(cartVO);
	}
	
	@PostMapping("/likeItem.do")
	@ResponseBody
	public int likeItem(CartVO cartVO) {
		return bCart.cart(cartVO);
	}
}
