package root.team.com.service.buyer;

import java.sql.SQLException;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import root.team.com.dao.BuyerDAO;
import root.team.com.vo.BuyerVO;

@Service("bJoin")
@AllArgsConstructor
public class BuyerJoinService implements BuyerService {
	private BuyerDAO dao;
	private BCryptPasswordEncoder cryptPasswordEncoder;

	public int join(BuyerVO buyerVO) {
		int result = 0;

		try {
			String b_pw = buyerVO.getB_pw();
			String encodePassword = cryptPasswordEncoder.encode(b_pw);

			buyerVO.setB_pw(encodePassword);

			result = dao.join(buyerVO);

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	public int getB_idx(String b_email) {
		int b_idx = 0;

		try {
			b_idx = dao.getB_idx(b_email);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return b_idx;
	}

	public int infoState(int b_idx) {
		int result = 0;

		try {
			if (dao.info(b_idx) == 1 && dao.state(b_idx) == 1) {
				result = 1;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
}