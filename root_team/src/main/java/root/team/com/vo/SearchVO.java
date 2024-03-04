package root.team.com.vo;

import lombok.Data;

//list.jsp에서 검색관련 데이터를 저장할 수 있는 DTO
@Data
public class SearchVO {
	private String searchField;
	private String searchWord;
	private String p_idx;
	private String c_idx;
	
	private int pageNum;
	private int pageBlock;
	private int startIdx;
}
