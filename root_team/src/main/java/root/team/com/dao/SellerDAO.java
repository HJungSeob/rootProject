package root.team.com.dao;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import root.team.com.vo.SellerVO;

@Repository
@RequiredArgsConstructor
public class SellerDAO {
	public static final String MAPPER="root.team.com.SellerMapper";
	private final SqlSession sqlSession;
	
	public int join(SellerVO vo) throws SQLException {
		return sqlSession.insert(MAPPER+".sellerJoin", vo);
	}
}
