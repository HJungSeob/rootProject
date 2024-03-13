package root.team.com.service.item;

import java.util.List;

import root.team.com.vo.ItemVO;
import root.team.com.vo.ReviewVO;
import root.team.com.vo.SearchVO;

public interface ItemService {

	default int insert(ItemVO vo) {
		return 0;
	}

	default ItemVO view(int i_idx) {
		return null;
	}

	default List<ItemVO> getItems(SearchVO vo) {
		return null;
	}
	
	default List<ItemVO> indexGetItems(SearchVO vo) {
		return null;
	}

	default int getTotalCount(SearchVO vo){
		return 0;
	}
	
	default List<ReviewVO> reviewList(int i_idx) {		
		return null;
	}
	
	default int getReviewTotalCount(SearchVO vo) {
		return 0;
	}

}
