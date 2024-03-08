package root.team.com.service.buyer;

import java.sql.SQLException;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import root.team.com.dao.BuyerDAO;
import root.team.com.vo.BuyerVO;

@Service("bUpdate")
@AllArgsConstructor
public class BuyerUpdateService implements BuyerService {
	private BuyerDAO dao;
	private BCryptPasswordEncoder cryptPasswordEncoder;

	public BuyerVO update(BuyerVO buyerVO) {
		BuyerVO newVO = null;// 회원가입 실패시 결과값
		try {
			if (buyerVO.getB_pw() != null) {
				buyerVO.setB_pw(cryptPasswordEncoder.encode(buyerVO.getB_pw()));
			}
			newVO = dao.updateBuyer(buyerVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return newVO;
	}

	public int verifyEmail(String b_email) {
		int result = 0;

			result = dao.verifyEmail(dao.getB_idx(b_email));
			
		return result;
	}

}
