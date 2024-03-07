package root.team.com.service.buyer;

import root.team.com.vo.CartVO;

public interface BuyerService2 {

	default int cart(CartVO cartVO) {
		return 0;
	}
}
