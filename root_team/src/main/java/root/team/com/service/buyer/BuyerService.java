package root.team.com.service.buyer;

import javax.servlet.http.HttpServletResponse;

import root.team.com.vo.AddressVO;
import root.team.com.vo.BuyerVO;

public interface BuyerService {

	default int join(BuyerVO buyerVO) {
		return 0;
	}

	default int infoState(BuyerVO buyerVO) {
		return 0;
	}

	default BuyerVO login(String b_email, String b_pw) {
		return null;
	}

	default BuyerVO update(BuyerVO buyerVO) {
		return null;
	}

	default AddressVO getAddress(int b_idx) {
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
	
	default int nicknameCheck(String b_nickname) {
		return 0;
	}

	default int emailCheck(String b_email) {
		return 0;
	}

	default int telCheck(String b_tel) {
		return 0;
	}

	default void sendEmail(BuyerVO buyerVO, String div) throws Exception {
	}

	default void findPw(HttpServletResponse response, BuyerVO buyerVO) throws Exception {
	}
	
	default int passwordCheck(int b_idx, String b_pw) {
		return 0;
	}
	
	default String joinEmail(String b_email){
		return null;
	}
	
	default int verifyEmail(String b_email) {
		return 0;
	}
}
