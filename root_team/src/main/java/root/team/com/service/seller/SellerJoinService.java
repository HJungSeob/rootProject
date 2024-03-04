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

	public int infoState(SellerVO sellerVO) {
		int result = 0;

		try {
			if (dao.info(sellerVO.getS_idx()) == 1 && dao.state(sellerVO.getS_idx()) == 1) {
				result = 1;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}
}
