package root.team.com.vo;

import java.util.Date;

import lombok.Data;

@Data	
public class OrderStateVO {
	private String b_nickname;
	private String i_name;
	private Date bo_orderdate;
	
	private int bos_idx;
	private int bo_idx;
	private int i_idx;
	private String bos_option;
	private String bos_price;
	private int bos_count;
	private String bos_sattle;
	private int bos_state;
	private Date bos_postdate;
}
