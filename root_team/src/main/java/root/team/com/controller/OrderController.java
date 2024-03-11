package root.team.com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.Setter;
import root.team.com.service.buyer.BuyerService;
import root.team.com.service.cart.CartService;
import root.team.com.service.global.GlobalService;
import root.team.com.vo.AddressVO;
import root.team.com.vo.CartVO;

@Controller
@RequestMapping("/cart")
public class OrderController {

	@Setter(onMethod_ = { @Autowired })
	CartService cList;

	@Setter(onMethod_ = { @Autowired })
	BuyerService bGetAddress;
	
	@Setter(onMethod_ = { @Autowired })
	GlobalService gDateUpdate, gFileNameUpdate;
	
	
	@PostMapping("/order.do")
	public String order(int b_idx, Model model) {
		
		AddressVO address =  bGetAddress.getAddress(b_idx);
		List<CartVO> cartList = cList.cartList(b_idx);	
		
		model.addAttribute("cartList", cartList);
		model.addAttribute("address", address);
		
		return "buyer/service/buyerShoppingPage";
	}
	
}
