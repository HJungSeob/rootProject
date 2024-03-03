package root.team.com.service.buyer;

import java.sql.SQLException;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import root.team.com.dao.BuyerDAO;

@Service("bCheck")
@AllArgsConstructor
public class BuyerCheckService implements BuyerService {
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
	
	public int telCheck(String b_tel) {
		int result = 0;
		
		try {
			result = dao.telCheck(b_tel);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
