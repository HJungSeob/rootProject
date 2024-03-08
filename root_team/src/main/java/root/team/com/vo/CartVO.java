package root.team.com.vo;

import java.util.Date;

import lombok.Data;

@Data	
public class CartVO {
	private int b_idx;
	private int i_idx;
	private String i_name;
	private String i_option;
	private String i_price;
	private String i_img;
	private Date savedate;
}
