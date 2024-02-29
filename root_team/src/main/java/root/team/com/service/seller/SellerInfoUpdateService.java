package root.team.com.service.seller;

import java.sql.SQLException;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import root.team.com.dao.SellerDAO;
import root.team.com.vo.SellerVO;

@Service("sInfoUpdate")
@AllArgsConstructor
public class SellerInfoUpdateService implements SellerService {
	private SellerDAO dao;

	public SellerVO update(SellerVO sellerVO) {
		SellerVO newVO = null;
		
		try {
			newVO = dao.infoUpdate(sellerVO);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return newVO;
	}

}
