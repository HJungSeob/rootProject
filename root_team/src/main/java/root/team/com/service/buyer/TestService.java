package root.team.com.service.buyer;

import root.team.com.vo.TestVO;

public interface TestService {
	// 인터페이스 내에 정의되는 메소드의 목적: 하위 계층에 있는 서비스클래의
	// 요청 처리 메소드를 오버라이딩할 수 있도록 하기 위함
	default int join(TestVO vo) {
		return 0;
	}

	default TestVO login(String b_id, String b_pw) {
		return null;
	}

	default TestVO update(TestVO vo) {
		return null;
	}

	default int cancel(int b_idx) {
		return 0;
	}

	default String joinEmail(String b_email){
		return null;
	}

}
