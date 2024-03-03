package root.team.com.service.buyer;

import root.team.com.vo.AddressVO;
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

	default BuyerVO update(BuyerVO buyerVO){
		return null;
	}

	default AddressVO getAddress(int b_idx){
		return null;
	}

	default int insertAddress(AddressVO addressVO) {
		return 0;
	}
	
	default AddressVO insertContact(AddressVO addressVO) {
		return null;
	}

	default int cancel(int b_idx) {
		return 0;
	}
	
	default int emailCheck(String b_email) {
		return 0;
	}
	
	default int telCheck(String b_tel) {
		return 0;
	}
}
