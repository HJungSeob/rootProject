package root.team.com.service.cart;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import root.team.com.dao.CartDAO;
import root.team.com.vo.CartVO;

@Service("clike")
@AllArgsConstructor
public class CartItemLikeService implements CartService {
	private CartDAO dao;

	public int likeItem(CartVO cartVO) {
		
		if(dao.searchLike(cartVO) != 1) {
			return dao.insertCart(cartVO);
		}
		
		return 0;
	}
}
