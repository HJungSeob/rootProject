package root.team.com.service.item;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import root.team.com.dao.ItemDAO;
import root.team.com.vo.SearchVO;

@Service("iTotalCount")
@AllArgsConstructor
public class ItemTotalCountService implements ItemService {

	private ItemDAO dao;
	
	public int getTotalCount(SearchVO vo) {	
		return dao.getTotalCount(vo);
	}
	

}
