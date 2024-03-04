package root.team.com.service.item;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import root.team.com.dao.ItemDAO;
import root.team.com.vo.ItemVO;
import root.team.com.vo.SearchVO;

@Service("iList")
@AllArgsConstructor
public class ItemListService implements ItemService {
	private ItemDAO dao;
	
	public List<ItemVO> getItems(SearchVO vo) {	
		return dao.getItems(vo);		
	}
}
