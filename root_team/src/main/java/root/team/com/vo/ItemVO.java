package root.team.com.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data	
public class ItemVO {
	private int c_idx;
	private String c_name;
	
	private int s_idx;
	private String s_profile;
	private String s_storename;
	private String s_storeintro;
	 
	private int i_idx;
	private String i_name;
	private String i_price;
	private String i_explain;
	private String i_count;
	private String i_option0;
	private String i_option1;
	private String i_option2;
	private String i_option3;
	private String i_option4;
	private String i_saveimg0;
	private String i_saveimg1;
	private String i_saveimg2;
	private String i_saveimg3;
	private String i_saveimg4;
	private String i_thumbnail;
	private Date i_regdate;
	private Date i_modifydate;
	
	private double avg_star;
	private int comment_count;
	
	private MultipartFile i_img0;
	private MultipartFile i_img1;
	private MultipartFile i_img2;
	private MultipartFile i_img3;
	private MultipartFile i_img4;
}
