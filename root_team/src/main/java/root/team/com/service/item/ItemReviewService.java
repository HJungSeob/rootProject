package root.team.com.service.item;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import root.team.com.dao.ItemDAO;
import root.team.com.vo.ReviewVO;

@Service("iReview")
@AllArgsConstructor
public class ItemReviewService implements ItemService {
	private ItemDAO dao;

	public List<ReviewVO> review(int i_idx) {		
		return dao.getReview(i_idx);
	}
}
