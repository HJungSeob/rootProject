package root.team.com.service.buyer;

import java.sql.SQLException;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import root.team.com.dao.TestDAO;
import root.team.com.vo.TestVO;

@Service("mJoin")
@AllArgsConstructor
public class TestJoinService implements TestService {
	private TestDAO dao;
	private BCryptPasswordEncoder cryptPasswordEncoder;

	public int join(TestVO memberVO) {
		int result = 0;// 회원가입 실패시 결과값

		try {
			//회원가입 정보 중 비밀번호 가져오기
			String member_pw = memberVO.getB_pw();
			//비밀번호를 암호화시켜서 결과 확인하기
			String encodePassword = cryptPasswordEncoder.encode(member_pw);		
			//암호화된 비밀번호를 memeberVO에 세팅하기
			memberVO.setB_pw(encodePassword);
			
			result = dao.join(memberVO);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

}
