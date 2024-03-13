package root.team.com.service.seller;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import root.team.com.dao.SellerDAO;
import root.team.com.vo.SearchVO;

@Service("sTotalCount")
@AllArgsConstructor
public class SellerTotalCountService implements SellerService {

	private SellerDAO dao;
	
	public int getItemTotalCount(SearchVO vo) {	
		return dao.getItemTotalCount(vo);
	}
	
	public int getOrderTotalCount(SearchVO vo) {	
		return dao.getOrderTotalCount(vo);
	}
}
