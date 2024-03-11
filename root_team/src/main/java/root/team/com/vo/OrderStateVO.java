package root.team.com.vo;

import java.util.Date;

import lombok.Data;

@Data	
public class OrderStateVO {
	private int bo_idx;
	private int i_idx;
	private String bos_option;
	private String bos_price;
	private String bos_count;
	private String bos_sattle;
	private String bos_state;
	private Date bos_postdate;	
}
