package root.team.com.vo;

import java.util.Date;

import lombok.Data;

//list.jsp에서 검색관련 데이터를 저장할 수 있는 DTO
@Data
public class SearchVO {
	private String orderNum;
	private String orderNickname;
	private int orderState;
	private String itemNum;
	private String itemName;
	private int itemState;
	private int largeCategory;
	private int smallCategory;
	private Date startDate;
	private Date endDate;
	private int s_idx;
	
	private String searchWord;
	private String searchField;
	private String orderByType;
	
	private int p_idx;
	private int c_idx;
	
	private int viewNum;
	private int pageNum;
	private int pageBlock;
	private int startIdx;
}
