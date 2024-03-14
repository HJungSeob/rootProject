package root.team.com.service.item;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import root.team.com.dao.ItemDAO;
import root.team.com.vo.ReviewVO;

@Service("iReviewInsert")
@AllArgsConstructor
public class ItemReviewInsertService implements ItemService {
	private ItemDAO dao;

	public int insertReview(ReviewVO reviewVO) {		
		return dao.insertReview(reviewVO);
	}
}
