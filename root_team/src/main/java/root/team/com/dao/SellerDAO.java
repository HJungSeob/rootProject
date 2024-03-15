package root.team.com.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import root.team.com.vo.ItemVO;
import root.team.com.vo.OrderStateVO;
import root.team.com.vo.ReviewVO;
import root.team.com.vo.SearchVO;
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
	
	public int storenameCheck(String s_storename) throws SQLException {
		return sqlSession.selectOne(MAPPER + ".storenameCheck", s_storename);
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
	
	public int verifyEmail(int s_idx) {
		return sqlSession.update(MAPPER + ".verifyEmail", s_idx);
	}
	
	public int getS_idx(String s_email) {
		return sqlSession.selectOne(MAPPER + ".getS_idx", s_email);
	}
	
	public List<ItemVO> getItem(int s_idx){
		return sqlSession.selectList(MAPPER + ".getItem", s_idx);
	}
	
	public List<ItemVO> getItems(SearchVO vo) {
		return sqlSession.selectList(MAPPER + ".getItems", vo);
	}
	
	public int getItemTotalCount(SearchVO vo) {	
		return sqlSession.selectOne(MAPPER + ".getItemTotalCount", vo);
	}
	
	public List<OrderStateVO> getOrder(int s_idx){
		return sqlSession.selectList(MAPPER + ".getOrder", s_idx);
	}
	
	public List<OrderStateVO> getOrders(SearchVO vo) {
		return sqlSession.selectList(MAPPER + ".getOrders", vo);
	}
	
	public int getOrderTotalCount(SearchVO vo) {	
		return sqlSession.selectOne(MAPPER + ".getOrderTotalCount", vo);
	}
	
	public int updateOrderState(OrderStateVO orderStateVO) {
		return sqlSession.update(MAPPER + ".updateOrderState", orderStateVO);
	}
	
	public int updateItemState(ItemVO itemVO) {
		return sqlSession.update(MAPPER + ".updateItemState", itemVO);
	}
	
	public List<ReviewVO> getReviews(SearchVO vo) {
		return sqlSession.selectList(MAPPER + ".getReviews", vo);
	}
	
	public int getReviewTotalCount(SearchVO vo) {	
		return sqlSession.selectOne(MAPPER + ".getReviewTotalCount", vo);
	}
}
