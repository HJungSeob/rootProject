package root.team.com.service.buyer;

import java.sql.SQLException;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import root.team.com.dao.BuyerDAO;
import root.team.com.vo.BuyerVO;

@Service("bCancel")
@AllArgsConstructor
public class BuyerCancelService implements BuyerService {
	private BuyerDAO dao;

	public int cancel(int b_idx) {
		int result = 0;
		
		try {
			result = dao.cancel(b_idx);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
