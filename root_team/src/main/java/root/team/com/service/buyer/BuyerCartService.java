package root.team.com.service.buyer;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import root.team.com.dao.BuyerDAO;
import root.team.com.vo.CartVO;

@Service("bCart")
@AllArgsConstructor
public class BuyerCartService implements BuyerService2 {
	private BuyerDAO dao;

	public int cart(CartVO cartVO) {		
		return dao.insertCart(cartVO);		
	}
}
