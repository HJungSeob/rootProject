package root.team.com.service.cart;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import root.team.com.dao.CartDAO;
import root.team.com.vo.CartVO;

@Service("cList")
@AllArgsConstructor
public class CartListService implements CartService {
	private CartDAO dao;
	
	public List<CartVO> cartList(int b_idx) {
		return dao.getCarts(b_idx);		
	}
}
