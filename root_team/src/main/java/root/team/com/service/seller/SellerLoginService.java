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
		SellerVO sellerVO = null;// 회원가입 실패시 결과값

		try {

			// 아이디를 이용해서 DB에 저장된 암호화된 비밀번호를 가져와서 로그인으로 입력되 비밀번호와 비교함
			String encodePassword = dao.getPassword(s_businessnum);
			if (encodePassword != null) { // 아이디가 유효한 경우
				if (cryptPasswordEncoder.matches(s_pw, encodePassword)) {
					// 암호화된 비밀번호와 로그인으로 입력된 비밀번호가 일치하는 경우
					// matches(원 비밀번호, 암호화된 비밀번호)
					sellerVO = dao.login(s_businessnum);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return sellerVO;
	}
}
