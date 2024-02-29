package root.team.com.service.buyer;

import java.sql.SQLException;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import root.team.com.dao.BuyerDAO;
import root.team.com.vo.BuyerVO;

@Service("bInfoUpdate")
@AllArgsConstructor
public class BuyerInfoUpdateService implements BuyerService {
	private BuyerDAO dao;

	public BuyerVO update(BuyerVO buyerVO) {
		BuyerVO newVO = null;
		
		try {
			newVO = dao.infoUpdate(buyerVO);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return newVO;
	}

}
