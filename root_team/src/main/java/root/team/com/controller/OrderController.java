package root.team.com.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.Setter;
import root.team.com.service.buyer.BuyerService;
import root.team.com.service.cart.CartService;
import root.team.com.service.global.GlobalService;
import root.team.com.service.order.OrderService;
import root.team.com.vo.AddressVO;
import root.team.com.vo.CartVO;
import root.team.com.vo.OrderStateVO;
import root.team.com.vo.OrderVO;

@Controller
@RequestMapping("/order")
public class OrderController {

	@Setter(onMethod_ = { @Autowired })
	CartService cList;

	@Setter(onMethod_ = { @Autowired })
	BuyerService bGetAddress;
	
	@Setter(onMethod_ = { @Autowired })
	OrderService oInsert, oDelete, oSuccess, oFind;
	
	@Setter(onMethod_ = { @Autowired })
	GlobalService gDateUpdate, gFileNameUpdate;
	
	
	@PostMapping("/order.do")
	public String order(int b_idx, int[] i_count, Model model) {
		
		AddressVO address =  bGetAddress.getAddress(b_idx);
		List<CartVO> cartList = cList.cartList(b_idx);				
		
		model.addAttribute("cartList", cartList);
		model.addAttribute("i_count", Arrays.toString(i_count));
		model.addAttribute("address", address);
		
		return "buyer/service/buyerShoppingPage";
	}
	
	@PostMapping("/insertOrder.do")
	@ResponseBody
	public int insertOrder(@RequestBody OrderVO orderVO) {	
		return oInsert.insertOrder(orderVO);	
	}
	
	@PostMapping("/deleteOrder.do")
	@ResponseBody
	public int deleteOrder(int bo_idx) {	
		return oDelete.deleteOrder(bo_idx);	
	}
	
	@PostMapping("/successOrder.do")
	@ResponseBody
	public int successOrder(@RequestBody OrderVO orderVO) {
		return oSuccess.successOrder(orderVO);	
	}
	
	@PostMapping("/findOrder.do")
	@ResponseBody
	public List<OrderStateVO> findOrder(int b_idx, int i_idx) {
		return oFind.findOrder(b_idx, i_idx);	
	}
	
	
}
