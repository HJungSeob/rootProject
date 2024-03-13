package root.team.com.service.item;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import root.team.com.dao.ItemDAO;
import root.team.com.vo.SearchVO;

@Service("iReviewTotalCount")
@AllArgsConstructor
public class ItemReviewTotalCountService implements ItemService {

	private ItemDAO dao;
	
	public int getReviewTotalCount(SearchVO vo) {	
		return dao.getReviewTotalCount(vo);
	}	

}
