package root.team.com.service.seller;

import java.sql.SQLException;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import root.team.com.dao.SellerDAO;

@Service("sCheck")
@AllArgsConstructor
public class SellerCheckService implements SellerService {
	private SellerDAO dao;
	private BCryptPasswordEncoder cryptPasswordEncoder;

	public int telCheck(String s_tel) {
		int result = 0;

		try {
			result = dao.telCheck(s_tel);

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	public int businessnumCheck(String s_businessnum) {
		int result = 0;

		try {
			result = dao.businessnumCheck(s_businessnum);

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	public int emailCheck(String s_email) {
		int result = 0;

		try {
			result = dao.emailCheck(s_email);

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	public int passwordCheck(int s_idx, String s_pw) {
		int result = 0;
		
		try {
			String encodePassword = dao.getPw(s_idx);
			if (cryptPasswordEncoder.matches(s_pw, encodePassword)) {
				result = 1;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}
}
