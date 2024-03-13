package root.team.com.service.seller;

import java.sql.SQLException;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import root.team.com.dao.SellerDAO;
import root.team.com.vo.OrderStateVO;
import root.team.com.vo.SellerVO;

@Service("sUpdate")
@AllArgsConstructor
public class SellerUpdateService implements SellerService {
	private SellerDAO dao;
	private BCryptPasswordEncoder cryptPasswordEncoder;

	public SellerVO update(SellerVO sellerrVO) {
		SellerVO newVO = null;
		
		try {
			if (sellerrVO.getS_pw() != null) {
				sellerrVO.setS_pw(cryptPasswordEncoder.encode(sellerrVO.getS_pw()));
			}
			newVO = dao.update(sellerrVO);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return newVO;
	}
	
	public int verifyEmail(String s_email) {
		return dao.verifyEmail(dao.getS_idx(s_email));
	}
	
	public int updateState(OrderStateVO orderStateVO) {
		return dao.updateState(orderStateVO);
	}
}
