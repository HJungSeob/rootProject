package root.team.com.service.buyer;

import java.sql.SQLException;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import root.team.com.dao.BuyerDAO;
import root.team.com.vo.BuyerVO;

@Service("bEmailCheck")
@AllArgsConstructor
public class BuyerEmailCheckService implements BuyerService {
	private BuyerDAO dao;

	public int emailCheck(String b_email) {
		int result = 0;
		
		try {
			result = dao.emailCheck(b_email);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
