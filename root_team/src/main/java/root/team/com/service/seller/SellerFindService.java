package root.team.com.service.seller;

import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import root.team.com.dao.SellerDAO;
import root.team.com.vo.BuyerVO;
import root.team.com.vo.SellerVO;

@Service("sFind")
@AllArgsConstructor
public class SellerFindService implements SellerService {
	private JavaMailSenderImpl mailSender;
	private SellerDAO dao;
	private BCryptPasswordEncoder cryptPasswordEncoder;

	public void sendEmail(SellerVO vo, String div) throws Exception {
		String fromEmail = "hgssgh123@gmail.com";
		String toEmail = vo.getS_email();
		String subject = "";
		String msg = "";

		if (div.equals("findpw")) {
			subject = "[ROOT] 임시 비밀번호 발급 메일입니다.";
			msg += "임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.";
			msg += "임시 비밀번호: ";
			msg += vo.getS_pw();
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
			String encryptedPassword = cryptPasswordEncoder.encode(vo.getS_pw());
			vo.setS_pw(encryptedPassword);
			dao.updatePassword(vo);
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}

	public void findPw(HttpServletResponse response, SellerVO vo) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		// 가입된 아이디가 없으면
		if (dao.matchBusinessnumEmail(vo) == 1) {
			// 새로운 비밀번호 생성
			String newS_pw = generateRandomPassword();

			vo.setS_pw(newS_pw);
			dao.updatePassword(vo);

			sendEmail(vo, "findpw");

			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();

		} else {
			out.print("전화번호와 이메일이 일치하지 않습니다.");
			out.close();
		}
	}

	private static String generateRandomPassword() {
		String lowerCaseChars = "abcdefghijklmnopqrstuvwxyz";
		String numbers = "0123456789";
		String specialChars = "!@#";

		Random random = new Random();
		StringBuilder password = new StringBuilder();

		for (int i = 0; i < 4; i++) {
			password.append(lowerCaseChars.charAt(random.nextInt(lowerCaseChars.length())));
		}

		for (int i = 0; i < 4; i++) {
			password.append(numbers.charAt(random.nextInt(numbers.length())));
		}

		password.append(specialChars.charAt(random.nextInt(specialChars.length())));

		return password.toString();
	}
}
