package root.team.com.service.seller;

import javax.servlet.http.HttpServletResponse;

import root.team.com.vo.BuyerVO;
import root.team.com.vo.SellerVO;

public interface SellerService {

	default int join(SellerVO sellerVO) {
		return 0;
	}

	default int infoState(SellerVO sellerVO) {
		return 0;
	}

	default SellerVO login(String s_businessnum, String s_pw){
		return null;
	}

	default SellerVO update(SellerVO sellerVO){
		return null;
	}
	
	default int cancel(int s_idx) {
		return 0;
	}
	
	default SellerVO getSeller(int S_idx){
		return null;
	}
	
	default int telCheck(String s_tel) {
		return 0;
	}
	
	default int businessnumCheck(String s_businessnum) {
		return 0;
	}
	
	default int emailCheck(String s_email) {
		return 0;
	}
	
	default void sendEmail(SellerVO sellerVO, String div) throws Exception {
	}

	default void findPw(HttpServletResponse response, SellerVO sellerVO) throws Exception {
	}
}
