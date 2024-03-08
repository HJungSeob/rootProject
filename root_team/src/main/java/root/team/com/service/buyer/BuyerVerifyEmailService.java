package root.team.com.service.buyer;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

@Service("bJoinEmail")
@AllArgsConstructor
public class BuyerVerifyEmailService implements BuyerService {
	private JavaMailSenderImpl mailSender;

	public String joinEmail(String b_email) {
		int authNumber = (int) (Math.random() * 888889) + 111111;

		String setFrom = "hgssgh123@gmail.com";
		String toMail = b_email;
		String title = "[root] 회원가입 인증 메일입니다.";
		String content = "홈페이지를 방문해주셔서 감사합니다.<br><br>" + "인증번호: " + authNumber + "<br>" + "해당 인증번호를 인증번호 확인란에 입력해 주세요.";
		mailSend(setFrom, toMail, title, content);

		return Integer.toString(authNumber);
	}

	private void mailSend(String setFrom, String toMail, String title, String content) {
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);

		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

}
