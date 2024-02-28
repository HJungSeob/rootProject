package root.team.com.service.item;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import root.team.com.dao.ItemDAO;
import root.team.com.vo.ItemVO;

@Service("iView")
@AllArgsConstructor
public class ItemViewService implements ItemService {
	private ItemDAO dao;

	public ItemVO view(int i_idx) {		
		return dao.getItem(i_idx);
	}
}
