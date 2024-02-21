package root.team.com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.Setter;
import root.team.com.service.buyer.TestService;
import root.team.com.vo.TestVO;

@Controller
@RequestMapping("/test")
public class testController {

//////////////////////////////필드와 의존 자동주입 //////////////////////////////

// 회원가입처리를 위한 Service클래스를 필드로 정의하기
	@Setter(onMethod_ = { @Autowired })
	TestService mJoin, mLogin;

/////////////////////////////// 요청 처리 메소드 /////////////////////////////////

	@GetMapping("/join.do")
	public String userLogin() {
		return "buyer/user/join";
	}

	// 회원가입 처리 요청
	@PostMapping("/joinProcess.do")
	public String joinProcess(TestVO memberVO) {
		// 회원가입 양식에서 전달된 입력값을 받을 수 있도록 커맨드 객체를 정의함
		// 커맨드 객체: 폼의 name과 같은 필드를 가지고 set메소드를 정의하고 있어야 함 - VO클래스
		String viewPage = "buyer/user/join";// 회원가입 실패 시 JSP페이지

		// 회원가입 요청 처리를 Service클래스에 위임
		// Service인터페이스를 상속한 클래스로 정의함
		// (예) MemberService인터페이스 - MemberJoinService클래스

		if (mJoin.join(memberVO) == 1) { // 회원가입 성공 시
			viewPage = "redirect:/index.do";// 메인 페이지를 재요청함
		}

		return viewPage;
	}
	
	// 로그인 페이지 요청
		@GetMapping("/login.do")
		public String login() {
			return "member/login";// views/member폴더에 대한 경로 추가
		}

		// 로그인 처리 요청
		@PostMapping("/loginProcess.do")
		public String loginProcess(String member_id, String member_pw, HttpServletRequest request, Model model) {
			// view단에서 post방시긍로 전달된 값은 요청처리 메소드의 매개변수로 받을 수 잇음
			// 전달 값의 name과 매개변수의 변수명을 동일하게 정의함
			// 로그인 처리 요청에 필요한 request객체와 model객체를 매개변수로 받을 수 있음
			String viewPage = "member/login";// 로그인 실패 시 JSP페이지

			// 로그인 요청 처리를 Service클래스에 위임 : MemberLoginService
			// Spring MVC에서는 Service클래스를 Service인터페이스를 상속한 클래스로 정의함
			TestVO memberVO = mLogin.login(member_id, member_pw);

			if (memberVO != null) { // 로그인 성공 시
				// 세션 객체에 회원정보 객체를 저장함
				HttpSession session = request.getSession();
				session.setAttribute("member", memberVO);
				viewPage = "redirect:/index.do";// 메인 페이지를 재요청함
			} else {
				model.addAttribute("msg", "아이디나 비밀번호가 일치하지 않습니다");
			}

			return viewPage;
		}

}
