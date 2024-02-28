package root.team.com.service.buyer;

import java.sql.SQLException;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import root.team.com.dao.BuyerDAO;
import root.team.com.vo.BuyerVO;

@Service("bLogin")
@AllArgsConstructor
public class BuyerLoginService implements BuyerService {
	private BuyerDAO dao;
	private BCryptPasswordEncoder cryptPasswordEncoder;

	public BuyerVO login(String b_email, String b_pw) {
		BuyerVO buyerVO = null;

		try {
			String encodePassword = dao.getPassword(b_email);
			
			if (encodePassword != null) {
				if (cryptPasswordEncoder.matches(b_pw, encodePassword)) {
					
					try {
						dao.lastLoginDate(dao.login(b_email).getB_idx());
					} catch (Exception e) {
					}
					
					buyerVO = dao.login(b_email);
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return buyerVO;
	}
}
