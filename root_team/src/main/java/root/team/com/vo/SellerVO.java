package root.team.com.vo;

import java.util.Date;

import lombok.Data;

@Data	
public class SellerVO {
	private int s_idx;
	private String s_businessnum;
	private String s_pw;
	private String s_firstname;
	private String s_lastname;
	private String s_email;
	private String s_tel;
	private String s_birth;
	private Date s_regdate;
	private Date s_lastlogindate;
	private Date s_modifydate;
	private Date s_pwmodifydate;
	
	private String s_cancel;
	private String s_check;
	private String s_terms;
	
	private String s_profile;
	private String s_storename;
	private String s_storeintro;
	private String s_address;
}
