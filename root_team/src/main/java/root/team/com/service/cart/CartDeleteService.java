package root.team.com.service.cart;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import root.team.com.dao.CartDAO;
import root.team.com.vo.CartVO;

@Service("cDelete")
@AllArgsConstructor
public class CartDeleteService implements CartService {
	private CartDAO dao;
	
	public int deleteCart(CartVO cartVO) {		
		return dao.deleteCart(cartVO);		
	}
}
