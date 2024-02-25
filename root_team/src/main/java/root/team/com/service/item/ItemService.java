package root.team.com.service.item;

import root.team.com.vo.ItemVO;

public interface ItemService {

	default int insert(ItemVO vo) {
		return 0;
	};

}
