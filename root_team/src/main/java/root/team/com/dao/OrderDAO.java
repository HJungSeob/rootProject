package root.team.com.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import root.team.com.vo.OrderStateVO;
import root.team.com.vo.OrderVO;

@Repository
@RequiredArgsConstructor
public class OrderDAO {
	public static final String MAPPER = "root.team.com.OrderMapper";
	private final SqlSession sqlSession;
	
	
	public int insertOrder(OrderVO vo) {
		 return sqlSession.insert(MAPPER + ".insertOrder", vo);
	}


	public int insertOrderState(OrderStateVO vo) {
		return sqlSession.insert(MAPPER + ".insertOrderState", vo);	
	}


	public int deleteOrder(int bo_idx) {	
		return sqlSession.delete(MAPPER + ".deleteOrder", bo_idx);
	}


	public int successOrder(int b_idx) {		
		return sqlSession.delete(MAPPER + ".successOrder", b_idx);
	}


	public int removeItemCount(OrderStateVO orderStateVO) {	
		return sqlSession.update(MAPPER + ".removeItemCount", orderStateVO);	
	}
 


}
