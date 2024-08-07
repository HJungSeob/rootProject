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
			msg += "임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.";
			msg += "임시 비밀번호: ";
			msg += vo.getB_pw();
		}

		// SimpleMailMessage 생성
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(toEmail);
		message.setFrom(fromEmail);
		message.setSubject(subject);
		message.setText(msg);

		try {
			mailSender.send(message);

			String encryptedPassword = cryptPasswordEncoder.encode(vo.getB_pw());
			vo.setB_pw(encryptedPassword);
			dao.updatePassword(vo);
			
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}

	public void findPw(HttpServletResponse response, BuyerVO vo) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		if (dao.matchTelEmail(vo) == 1) {
			String newB_pw = generateRandomPassword();

			vo.setB_pw(newB_pw);
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
