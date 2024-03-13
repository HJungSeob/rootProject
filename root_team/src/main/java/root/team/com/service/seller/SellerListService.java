package root.team.com.service.seller;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import root.team.com.dao.SellerDAO;
import root.team.com.vo.ItemVO;
import root.team.com.vo.OrderStateVO;
import root.team.com.vo.SearchVO;

@Service("sList")
@AllArgsConstructor
public class SellerListService implements SellerService {
	private SellerDAO dao;

	public List<ItemVO> getItem(int s_idx) {
		return dao.getItem(s_idx);
	}
	
	public List<ItemVO> getItems(SearchVO vo) {
		vo.setStartIdx((vo.getPageNum() - 1) * 6);
		
		return dao.getItems(vo);
	}
	
	public List<OrderStateVO> getOrders(SearchVO vo) {
		vo.setStartIdx((vo.getPageNum() - 1) * 6);
		
		return dao.getOrders(vo);
	}
	
}
