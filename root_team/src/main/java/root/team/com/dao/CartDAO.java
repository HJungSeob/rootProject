package root.team.com.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import root.team.com.vo.CartVO;

@Repository
@RequiredArgsConstructor
public class CartDAO {
	public static final String MAPPER = "root.team.com.CartMapper";
	private final SqlSession sqlSession;

	public int searchCart(CartVO vo) {
		return sqlSession.selectOne(MAPPER + ".searchCart", vo);
	}
	
	public int insertCart(CartVO vo) {
	    return sqlSession.insert(MAPPER + ".insertCart", vo);
	}

	public List<CartVO> getCarts(int b_idx) {		
		return sqlSession.selectList(MAPPER + ".getCarts", b_idx);
	}

	public int deleteCart(CartVO vo) {
        return sqlSession.delete(MAPPER + ".deleteCart", vo);
    }

}
