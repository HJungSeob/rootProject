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
			System.out.println("암호화된 비밀번호: " + encodePassword);
			System.out.println("암호화된 비밀번호 길이: " + encodePassword.length());

			System.out.println("원 비밀번호와 암호화된 비밀번호 일치 여부: " + cryptPasswordEncoder.matches(s_pw, encodePassword));

			sellerVO.setS_pw(encodePassword);

			result = dao.join(sellerVO);

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}
}
