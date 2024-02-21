package root.team.com.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import root.team.com.vo.TestVO;

@Repository
@RequiredArgsConstructor
public class TestDAO {

	// MyBatis를 사용할 때 각각의 Mapper 내에 있는 SQL문을 Mapper의 네임스페이스와
	// SQL문의 id값으로 구분함 => 각 Mapper 파일의 네임스페이스를 상수로 정의해서
	// sqlSession 메소드 호출시 사용함
	public static final String MAPPER = "root.team.com.TestMapper";

	// MyBatis를 이용한 DB 연결 및 작업을 담달할 SqlSession 객체를 필드로 정의함
	private final SqlSession sqlSession;

	// 아이디 중복검사
	public int checkId(String member_id) throws SQLException {
		return sqlSession.selectOne(MAPPER+".checkId", member_id);
	}

	// 회원정보 입력하기: join(MemberDTO vo): int
	public int join(TestVO vo) throws SQLException {
		return sqlSession.insert(MAPPER+".join", vo);
	}

	// 모든 회원정보 가져오기:getMembers(): List<MemberDTO>
	public List<TestVO> getMembers() throws SQLException {
		return sqlSession.selectList(MAPPER+".getMembers");
	}

	// 회원정보 수정하기
	public TestVO updateMember(TestVO vo) throws SQLException {
		TestVO newVO = null;
		if (sqlSession.update(MAPPER+".updateMember", vo) == 1) {// 회원정보 업데이트 성공
			newVO = getMember(vo.getB_idx());
		}
		return newVO;
	}
	
	// 한명의 회원정보 가져오기
	public TestVO getMember(int m_idx) throws SQLException {
		return sqlSession.selectOne(MAPPER+".getMember", m_idx);
	}

	// 로그인 처리하기
	public TestVO login(String member_id) throws SQLException {
		return sqlSession.selectOne(MAPPER+".login", member_id);
	}
	
	public String getPassword(String member_id) {
		return sqlSession.selectOne(MAPPER+".getPassword", member_id);
	}

	// 회원 탈퇴하기
	public int cancel(int m_idx) throws SQLException {
		return sqlSession.update(MAPPER+".cancel", m_idx);
	}

	

	

	
}
