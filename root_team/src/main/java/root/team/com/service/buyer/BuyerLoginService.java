package root.team.com.service.buyer;

import java.sql.SQLException;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import root.team.com.dao.BuyerDAO;
import root.team.com.service.global.GlobalService;
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
					dao.lastLoginDate(dao.login(b_email).getB_idx());
					buyerVO = dao.login(b_email);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return buyerVO;
	}
	
	
}
