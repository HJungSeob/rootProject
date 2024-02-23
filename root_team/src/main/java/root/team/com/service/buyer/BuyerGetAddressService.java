package root.team.com.service.buyer;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import root.team.com.dao.BuyerDAO;
import root.team.com.vo.AddressVO;

@Service("bGetAddress")
@AllArgsConstructor
public class BuyerGetAddressService implements BuyerService {
	private BuyerDAO dao;

	public AddressVO getAddress(int b_idx){
		return dao.getAddress(b_idx);
	}

}
