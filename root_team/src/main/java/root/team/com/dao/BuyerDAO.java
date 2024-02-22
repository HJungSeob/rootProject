package root.team.com.dao;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import root.team.com.vo.BuyerVO;

@Repository
@RequiredArgsConstructor
public class BuyerDAO {
	public static final String MAPPER = "root.team.com.BuyerMapper";
	private final SqlSession sqlSession;

	public int join(BuyerVO vo) throws SQLException {
		return sqlSession.insert(MAPPER + ".join", vo);
	}

	public int getB_idx(String b_email) throws SQLException {
		return sqlSession.selectOne(MAPPER + ".getB_idx", b_email);
	}

	public int info(int b_idx) throws SQLException {
		return sqlSession.insert(MAPPER + ".info", b_idx);
	}

	public int state(int b_idx) throws SQLException {
		return sqlSession.insert(MAPPER + ".state", b_idx);
	}

	public String getPassword(String b_email) throws SQLException {
		return sqlSession.selectOne(MAPPER + ".getPassword", b_email);
	}

	public BuyerVO login(String b_email) throws SQLException {
		return sqlSession.selectOne(MAPPER + ".login", b_email);
	}

	public void lastLoginDate(int b_idx) throws SQLException {
		sqlSession.update(MAPPER + ".lastLoginDate", b_idx);
	}
}
