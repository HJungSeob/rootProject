package root.team.com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.Setter;
import root.team.com.service.cart.CartService;
import root.team.com.service.global.GlobalService;
import root.team.com.vo.CartVO;

@Controller
@RequestMapping("/cart")
public class CartController {

	@Setter(onMethod_ = { @Autowired })
	CartService cInsert, cList, cDelete;

	@Setter(onMethod_ = { @Autowired })
	GlobalService gDateUpdate, gFileNameUpdate;

	@PostMapping("/insertCart.do")
	@ResponseBody
	public int insertCart(CartVO cartVO) {			
		return cInsert.insertCart(cartVO);
	}
	
	@PostMapping("/cartList.do")
	@ResponseBody
	public List<CartVO> cartList(int b_idx) {
		return cList.cartList(b_idx);
	}
	
	@GetMapping("/cart.do")
	public String cart(int b_idx, Model model) {
		
		List<CartVO> cartList = cList.cartList(b_idx);	
		model.addAttribute("cartList", cartList);
		
		return "buyer/service/buyerItemCart";
	}
	
	@PostMapping("/deleteCart.do")
	@ResponseBody
	public int deleteCart(CartVO cartVO) {
		return cDelete.deleteCart(cartVO);
	}
	
	@GetMapping("/order.do")
	public String order() {
		return "buyer/service/buyerShippingPage";
	}
}
