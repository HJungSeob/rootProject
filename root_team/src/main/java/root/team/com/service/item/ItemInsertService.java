package root.team.com.service.item;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import root.team.com.dao.ItemDAO;
import root.team.com.vo.ItemVO;

@Service("iInsert")
@AllArgsConstructor
public class ItemInsertService implements ItemService {
	private ItemDAO dao;

	public int insert(ItemVO vo) {

		int result = 0;
		
		if (dao.insert(vo) == 1) {		
			if (dao.insertItemOption(vo) == 1 && dao.insertItemImage(vo) == 1) {
				result = 1;
			}
		}
		return result;
	}
}
