package root.team.com.service.buyer;

import java.sql.SQLException;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import root.team.com.dao.TestDAO;
import root.team.com.vo.TestVO;

@Service("mLogin")
@AllArgsConstructor
public class TestLoginService implements TestService {
	private TestDAO dao;
	private BCryptPasswordEncoder cryptPasswordEncoder;

	@Override
	public TestVO login(String b_email, String b_pw) {
		TestVO testVO = null;// 회원가입 실패시 결과값

		try {

			// 아이디를 이용해서 DB에 저장된 암호화된 비밀번호를 가져와서
			// 로그인으로 입력된 비밀번호와 비교함
			String encodePassword = dao.getPassword(b_email);

			if (encodePassword != null) {//아이디가 유효한 경우
				if(cryptPasswordEncoder.matches(b_pw, encodePassword)) {
				//암호화된 비밀번호와 로그인으로 입력된 비밀번호가 일치하는 경우
				//matches.(입력된 비밀번호, 암호화된 비밀번호)
					testVO = dao.login(b_email);
				}						
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return testVO;
	}

}
