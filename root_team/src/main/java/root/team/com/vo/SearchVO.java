package root.team.com.vo;

import lombok.Data;

//list.jsp에서 검색관련 데이터를 저장할 수 있는 DTO
@Data
public class SearchVO {
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
