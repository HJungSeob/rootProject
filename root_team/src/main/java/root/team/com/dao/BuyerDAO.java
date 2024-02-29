package root.team.com.dao;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import root.team.com.vo.AddressVO;
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

	public BuyerVO updateBuyer(BuyerVO vo) throws SQLException {
		BuyerVO newVO = null;
		if (sqlSession.update(MAPPER + ".updateBuyer", vo) == 1) {// 회원정보 업데이트 성공
			newVO = getBuyer(vo.getB_idx());
		}
		return newVO;
	}

	public BuyerVO getBuyer(int b_idx) throws SQLException {
		return sqlSession.selectOne(MAPPER + ".getBuyer", b_idx);
	}

	public AddressVO getAddress(int b_idx) {
		return sqlSession.selectOne(MAPPER + ".getAddress", b_idx);
	}

	public int changeDefaultAddress(int b_idx) {
		return sqlSession.update(MAPPER + ".changeDefaultAddress", b_idx);
	}

	public int insertAddress(AddressVO vo) throws SQLException {
		return sqlSession.insert(MAPPER + ".insertAddress", vo);
	}

	public AddressVO insertContact(AddressVO vo) throws SQLException {
		AddressVO newVO = null;
		if (sqlSession.update(MAPPER + ".insertContact", vo) == 1) {
			newVO = getAddress(vo.getB_idx());
		}
		return newVO;
	}

	public BuyerVO infoUpdate(BuyerVO vo) throws SQLException {
		BuyerVO newVO = null;
		
		if (sqlSession.update(MAPPER + ".infoUpdate", vo) == 2) {
			newVO = getBuyer(vo.getB_idx());
		}
		
		return newVO;
	}

	public int cancel(int b_idx) throws SQLException {
		return sqlSession.update(MAPPER + ".cancel", b_idx);
	}
}
