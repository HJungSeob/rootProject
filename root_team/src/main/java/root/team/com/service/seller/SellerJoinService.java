package root.team.com.service.seller;

import java.sql.SQLException;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import root.team.com.dao.SellerDAO;
import root.team.com.vo.SellerVO;

@Service("sJoin")
@AllArgsConstructor
public class SellerJoinService implements SellerService {
	private SellerDAO dao;
	private BCryptPasswordEncoder cryptPasswordEncoder;

	public int join(SellerVO sellerVO) {
		int result = 0;

		try {
			String s_pw = sellerVO.getS_pw();
			String encodePassword = cryptPasswordEncoder.encode(s_pw);

			sellerVO.setS_pw(encodePassword);

			result = dao.join(sellerVO);

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	public int getS_idx(String s_businessnum) {
		int s_idx = 0;

		try {
			s_idx = dao.getS_idx(s_businessnum);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return s_idx;
	}

	public int infoState(int s_idx) {
		int result = 0;

		try {
			if (dao.info(s_idx) == 1 && dao.state(s_idx) == 1) {
				result = 1;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
}
