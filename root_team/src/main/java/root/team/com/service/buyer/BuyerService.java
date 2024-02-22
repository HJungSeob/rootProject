package root.team.com.service.buyer;

import root.team.com.vo.BuyerVO;

public interface BuyerService {

	default int join(BuyerVO buyerVO) {
		return 0;
	}

	default int infoState(String b_emaill) {
		return 0;
	}

	default BuyerVO login(String b_email, String b_pw){
		return null;
	}
}
