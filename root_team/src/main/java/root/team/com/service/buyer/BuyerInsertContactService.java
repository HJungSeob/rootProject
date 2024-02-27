package root.team.com.service.buyer;

import java.sql.SQLException;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import root.team.com.dao.BuyerDAO;
import root.team.com.vo.AddressVO;
import root.team.com.vo.BuyerVO;

@Service("bInsertContact")
@AllArgsConstructor
public class BuyerInsertContactService implements BuyerService {
	private BuyerDAO dao;

	public AddressVO insertContact(AddressVO addressVO) {
		AddressVO newVO = null;

		try {
			newVO = dao.insertContact(addressVO);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return newVO;
	}
}
