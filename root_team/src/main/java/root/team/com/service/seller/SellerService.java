package root.team.com.service.seller;

import root.team.com.vo.SellerVO;

public interface SellerService {

	default int join(SellerVO sellerVO) {
		return 0;
	}
}
