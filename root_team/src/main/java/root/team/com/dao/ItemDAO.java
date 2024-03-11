package root.team.com.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import root.team.com.vo.ItemVO;
import root.team.com.vo.ReviewVO;
import root.team.com.vo.SearchVO;

@Repository
@RequiredArgsConstructor
public class ItemDAO {
	public static final String MAPPER = "root.team.com.ItemMapper";
	private final SqlSession sqlSession;

	public int insert(ItemVO vo){
		return sqlSession.insert(MAPPER + ".insertItem", vo);
	}

	public int insertItemOption(ItemVO vo){
		return sqlSession.insert(MAPPER + ".insertItemOption", vo);	
	}

	public int insertItemImage(ItemVO vo){
		return sqlSession.insert(MAPPER + ".insertItemImage", vo);
	}
	
	public int insertItemThumbnail(ItemVO vo){
		return sqlSession.insert(MAPPER + ".insertItemThumbnail", vo);
	}
	
	public ItemVO getItem(int i_idx){
		return sqlSession.selectOne(MAPPER + ".getItem", i_idx);
	}

	public List<ItemVO> getItems(SearchVO vo){
		return sqlSession.selectList(MAPPER + ".getItems", vo);
	}

	public int getTotalCount(SearchVO vo) {	
		return sqlSession.selectOne(MAPPER + ".getTotalCount", vo);
	}

	public List<ReviewVO> getReview(int i_idx) {
		return sqlSession.selectList(MAPPER + ".getReviews", i_idx);
	}
	
}
