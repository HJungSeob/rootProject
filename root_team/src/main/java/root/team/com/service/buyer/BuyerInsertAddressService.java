package root.team.com.service.buyer;

import java.sql.SQLException;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import root.team.com.dao.BuyerDAO;
import root.team.com.vo.AddressVO;

@Service("bInsertAddress")
@AllArgsConstructor
public class BuyerInsertAddressService implements BuyerService {
	private BuyerDAO dao;

	public int insertAddress(AddressVO addressVO) {
		int result = 0;

		try {
			dao.changeDefaultAddress(addressVO.getB_idx());
			result = dao.insertAddress(addressVO);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}
}
