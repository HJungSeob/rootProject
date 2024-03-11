package root.team.com.service.cart;

import java.util.List;

import root.team.com.vo.CartVO;

public interface CartService {

	default int insertCart(CartVO cartVO) {
		return 0;
	}

	default List<CartVO> cartList(int b_idx) {
		return null;
	}

	default int deleteCart(CartVO cartVO) {
		return 0;
	}

	default int likeItem(CartVO cartVO) {
		return 0;
	}


}
 