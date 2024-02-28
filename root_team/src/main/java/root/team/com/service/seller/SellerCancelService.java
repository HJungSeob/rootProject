package root.team.com.service.seller;

import java.sql.SQLException;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import root.team.com.dao.SellerDAO;

@Service("sCancel")
@AllArgsConstructor
public class SellerCancelService implements SellerService {
	private SellerDAO dao;

	public int cancel(int s_idx) {
		int result = 0;
		
		try {
			result = dao.cancel(s_idx);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
