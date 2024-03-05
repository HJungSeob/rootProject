package root.team.com.service.buyer;

import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import root.team.com.dao.BuyerDAO;
import root.team.com.vo.BuyerVO;

@Service("bFind")
@AllArgsConstructor
public class BuyerFindService implements BuyerService {
	private JavaMailSenderImpl mailSender;
	private BuyerDAO dao;
	private BCryptPasswordEncoder cryptPasswordEncoder;

	public void sendEmail(BuyerVO vo, String div) throws Exception {
		String fromEmail = "hgssgh123@gmail.com";
		String toEmail = vo.getB_email();
		String subject = "";
		String msg = "";

		if (div.equals("findpw")) {
			subject = "[ROOT] 임시 비밀번호 발급 메일입니다.";
			msg += vo.getB_lastname() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.";
			msg += "임시 비밀번호 : ";
			msg += vo.getB_pw(); // 실제 비밀번호를 이메일에 포함시킴
		}

		// SimpleMailMessage 생성
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(toEmail);
		message.setFrom(fromEmail);
		message.setSubject(subject);
		message.setText(msg);

		try {
			mailSender.send(message);

			// 이메일 전송 후에 암호화된 비밀번호로 업데이트
			String encryptedPassword = cryptPasswordEncoder.encode(vo.getB_pw());
			vo.setB_pw(encryptedPassword);
			dao.updatePassword(vo);
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}

	public void findPw(HttpServletResponse response, BuyerVO vo) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		BuyerVO newVO = dao.selectBuyer(vo.getB_email());
		PrintWriter out = response.getWriter();

		// 가입된 아이디가 없으면
		if (dao.telCheck(vo.getB_tel()) == 0) {
			out.print("등록되지 않은 전화번호입니다.");
			out.close();
		}
		// 가입된 이메일이 아니면
		else if (!vo.getB_email().equals(newVO.getB_email())) {
			out.print("등록되지 않은 이메일입니다.");
			out.close();
		}
		// 가입이 되어 있다면
		else {
			// 새로운 비밀번호 생성
			String newB_pw = generateRandomPassword();

			vo.setB_pw(newB_pw);
			dao.updatePassword(vo);

			sendEmail(vo, "findpw");

			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
	}

	private static String generateRandomPassword() {
		String lowerCaseChars = "abcdefghijklmnopqrstuvwxyz";
		String numbers = "0123456789";
		String specialChars = "!@#";

		Random random = new Random();
		StringBuilder password = new StringBuilder();

		// 소문자 4자리
		for (int i = 0; i < 4; i++) {
			password.append(lowerCaseChars.charAt(random.nextInt(lowerCaseChars.length())));
		}

		// 숫자 4자리
		for (int i = 0; i < 4; i++) {
			password.append(numbers.charAt(random.nextInt(numbers.length())));
		}

		// 특수문자 1자리
		password.append(specialChars.charAt(random.nextInt(specialChars.length())));

		return password.toString();
	}
}
