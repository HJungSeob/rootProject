package root.team.com.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import root.team.com.vo.ItemVO;

@Repository
@RequiredArgsConstructor
public class ItemDAO {
	public static final String MAPPER = "root.team.com.ItemMapper";
	private final SqlSession sqlSession;

	public int insert(ItemVO vo) {
		return sqlSession.insert(MAPPER + ".insert", vo);
	}
	
}