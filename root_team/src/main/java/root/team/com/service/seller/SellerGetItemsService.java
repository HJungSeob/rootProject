package root.team.com.service.seller;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import root.team.com.dao.SellerDAO;
import root.team.com.vo.ItemVO;

@Service("sGet")
@AllArgsConstructor
public class SellerGetItemsService implements SellerService {
	private SellerDAO dao;

	public List<ItemVO> getItems(int s_idx) {
		return dao.getItems(s_idx);
	}
}
