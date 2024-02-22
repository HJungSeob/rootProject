package root.team.com.service.buyer;

import root.team.com.vo.BuyerVO;

public interface BuyerService {

	default int join(BuyerVO buyerVO) {
		return 0;
	}
	
	default int getB_idx(String b_emaill) {
		return 0;
	}

	default int infoState(int b_idx) {
		return 0;
	}

	
}
