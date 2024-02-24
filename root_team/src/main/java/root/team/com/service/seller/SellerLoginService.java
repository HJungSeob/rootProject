package root.team.com.service.seller;

import java.sql.SQLException;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import root.team.com.dao.SellerDAO;
import root.team.com.vo.SellerVO;

@Service("sLogin")
@AllArgsConstructor
public class SellerLoginService implements SellerService {
	private SellerDAO dao;
	private BCryptPasswordEncoder cryptPasswordEncoder;

	public SellerVO login(String s_businessnum, String s_pw) {
		SellerVO sellerVO = null;

		try {
			String encodePassword = dao.getPassword(s_businessnum);
			if (encodePassword != null) {
				if (cryptPasswordEncoder.matches(s_pw, encodePassword)) {
					dao.lastLoginDate(dao.login(s_businessnum).getS_idx());
					sellerVO = dao.login(s_businessnum);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return sellerVO;
	}
}
