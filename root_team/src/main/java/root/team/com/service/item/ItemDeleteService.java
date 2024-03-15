package root.team.com.service.item;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import root.team.com.dao.ItemDAO;

@Service("iDelete")
@AllArgsConstructor
public class ItemDeleteService implements ItemService {
	private ItemDAO dao;
	
	public int deleteItem(int i_idx) {		
		return dao.deleteItem(i_idx);		
	}
}
