package root.team.com.service.seller;

import java.sql.SQLException;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import root.team.com.dao.SellerDAO;
import root.team.com.vo.SellerVO;

@Service("sGet")
@AllArgsConstructor
public class SellerGetService implements SellerService {
	private SellerDAO dao;

	public SellerVO getSeller(int S_idx) {
		SellerVO sellerVO = null;

		try {
			sellerVO = dao.getSeller(S_idx);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return sellerVO;
	}
}
