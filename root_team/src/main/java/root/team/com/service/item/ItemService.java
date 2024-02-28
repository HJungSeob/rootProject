package root.team.com.service.item;

import root.team.com.vo.ItemVO;

public interface ItemService {

	default int insert(ItemVO vo) {
		return 0;
	}

	default ItemVO view(int i_idx) {
		return null;
	}

}
