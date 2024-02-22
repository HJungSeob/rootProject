package root.team.com.vo;

import java.util.Date;

import lombok.Data;

@Data	
public class BuyerVO {
	private int b_idx;
	private String b_tel;
	private String b_firstname;
	private String b_lastname;
	private String b_birth;
	private String b_email;
	private String b_pw;
	private Date b_regdate;
	private Date b_modifydate;
	
	private String b_cancel;
	private	String b_check;
	private String b_terms;
	
	private String b_grade;
	private int b_gender;
	private String b_nickname;
	private String b_profile;
	private String b_point;
}
