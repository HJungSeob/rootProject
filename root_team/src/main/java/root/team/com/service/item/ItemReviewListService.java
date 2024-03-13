package root.team.com.service.item;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import root.team.com.dao.ItemDAO;
import root.team.com.vo.ReviewVO;

@Service("iReviewList")
@AllArgsConstructor
public class ItemReviewListService implements ItemService {
	private ItemDAO dao;

	public List<ReviewVO> reviewList(int i_idx) {		
		return dao.getReviews(i_idx);
	}
}
