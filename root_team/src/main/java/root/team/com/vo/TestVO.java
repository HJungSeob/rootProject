package root.team.com.vo;

import java.util.Date;

import lombok.Data;

//DTO(Data Transfer Object): 데이터를 저장하고 전달하는 역할을 하는 자바클래스
//회원DTO는 tb_member테이블의 컬럼명 개수와 같이 필드 선언
@Data
public class TestVO {
	private int b_idx;
	private String b_name;
	private String b_tel;
	private String b_birth;
	private String b_email;
	private String b_pw;
	private Date b_regdate;
	private Date b_modifydate;
}
