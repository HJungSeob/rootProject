package root.team.com.service.cart;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import root.team.com.dao.CartDAO;
import root.team.com.vo.CartVO;

@Service("cInsert")
@AllArgsConstructor
public class CartInsertService implements CartService {
	private CartDAO dao;

	public int insertCart(CartVO cartVO) {
		
		if(dao.searchCart(cartVO) != 1) {
			return dao.insertCart(cartVO);
		}
		
		return 0;
	}
}
