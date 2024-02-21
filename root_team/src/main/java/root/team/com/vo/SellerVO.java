package root.team.com.vo;

import java.util.Date;

import lombok.Data;

@Data	
public class SellerVO {
	private int s_idx;
	private String s_businessnum;
	private String s_pw;
	private String s_name;
	private String s_email;
	private String s_tel;
	private String s_birth;
	private Date s_regdate;
	private Date s_modifydate;
	
	private int s_cancel;
	private int s_check;
	
	private String s_profile;
	private String s_storename;
	private String s_storeintro;
}
