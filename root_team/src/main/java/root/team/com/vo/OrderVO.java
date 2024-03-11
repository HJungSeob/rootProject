package root.team.com.vo;

import java.util.Date;

import lombok.Data;

@Data	
public class OrderVO {
	private int bo_idx;
	private int b_idx;
	private String bo_itmename;
	private String bo_name;
	private String bo_zipcode;
	private String bo_address;
	private String bo_contact;
	private Date bo_orderdate;
	
	private OrderStateVO[] orderStateVO;
}
