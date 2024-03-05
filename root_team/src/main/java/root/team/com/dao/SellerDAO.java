package root.team.com.dao;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import root.team.com.vo.BuyerVO;
import root.team.com.vo.SellerVO;

@Repository
@RequiredArgsConstructor
public class SellerDAO {
	public static final String MAPPER = "root.team.com.SellerMapper";
	private final SqlSession sqlSession;

	public int join(SellerVO vo) throws SQLException {
		return sqlSession.insert(MAPPER + ".join", vo);
	}

	public int info(int s_idx) throws SQLException {
		return sqlSession.insert(MAPPER + ".info", s_idx);
	}

	public int state(int s_idx) throws SQLException {
		return sqlSession.insert(MAPPER + ".state", s_idx);
	}

	public String getPassword(String s_businessnum) throws SQLException {
		return sqlSession.selectOne(MAPPER + ".getPassword", s_businessnum);
	}

	public SellerVO login(String s_businessnum) throws SQLException {
		return sqlSession.selectOne(MAPPER + ".login", s_businessnum);
	}

	public void lastLoginDate(int s_idx) throws SQLException {
		sqlSession.update(MAPPER + ".lastLoginDate", s_idx);
	}

	public SellerVO update(SellerVO vo) throws SQLException {
		SellerVO newVO = null;
		
		if (sqlSession.update(MAPPER + ".update", vo) == 1) {
			newVO = getSeller(vo.getS_idx());
		}
		
		return newVO;
	}
	
	public SellerVO infoUpdate(SellerVO vo) throws SQLException {
		SellerVO newVO = null;
		
		if (sqlSession.update(MAPPER + ".infoUpdate", vo) == 2) {
			newVO = getSeller(vo.getS_idx());
		}
		
		return newVO;
	}

	public SellerVO getSeller(int s_idx) throws SQLException {
		return sqlSession.selectOne(MAPPER + ".getSeller", s_idx);
	}
	
	public int cancel(int s_idx) throws SQLException {
		return sqlSession.update(MAPPER + ".cancel", s_idx);
	}
	
	public int telCheck(String s_tel) throws SQLException {
		return sqlSession.selectOne(MAPPER + ".telCheck", s_tel);
	}
	
	public int businessnumCheck(String s_businessnum) throws SQLException {
		return sqlSession.selectOne(MAPPER + ".businessnumCheck", s_businessnum);
	}
	
	public int emailCheck(String s_email) throws SQLException {
		return sqlSession.selectOne(MAPPER + ".emailCheck", s_email);
	}
	
	public int updatePassword(SellerVO vo) throws Exception {
		return sqlSession.update(MAPPER + ".updatePassword", vo);
	}
	
	public int matchBusinessnumEmail(SellerVO vo) throws SQLException {
		return sqlSession.selectOne(MAPPER + ".matchBusinessnumEmail", vo);
	}
	
	public int passwordCheck(String s_pw) throws SQLException {
		return sqlSession.selectOne(MAPPER + ".passwordCheck", s_pw);
	}
	
	public String getPw(int s_idx) throws SQLException {
		return sqlSession.selectOne(MAPPER + ".getPw", s_idx);
	}
}
