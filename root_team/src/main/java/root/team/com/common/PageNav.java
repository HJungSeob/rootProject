package root.team.com.common;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class PageNav {

//	<<페이지 네비게이션 구현을 위한 변수들>>
//	1. 총 게시물수 : totalRows
//	2. 한 페이지에 보여줄 게시물수 : rows_page
//	   - 개발자가 정함, 10 
//	3. 한 페이지블록에 보여줄 페이지수 : pages_pageBlock
//	   - 개발자가 정함, 5  
//	4. 현재 페이지번호 : pageNum
//	   - pageNum 전달값이 없는 경우 1로 초기화함
//	5. 게시물의 시작번호 : startNum
//	   - (현재 페이지번호 - 1)*rows_page + 1   
//	6. 게시물의 끝번호 : endNum
//	   - 현재 페이지번호*rows_page  
//	7. 현재 페이지블록번호 : pageBlock
//	   - pageBlock 전달값이 없는 경우 1로 초기화함
//	8. 마지막/총 페이지번호 : total_pageNum
//	   - (총 게시물수 / rows_page)의 올림값(Math.ceil())
//	9. 마지막 페이지블록번호 : last_pageBlock
//	   - (총 페이지번호 / pages_pageBlock)의 올림값(Math.ceil())

	private int totalRows;
	private int rows_page;
	private int pages_pageBlock;
	private int pageNum;
	private int startNum;
	private int endNum;
	private int pageBlock;
	private int total_pageNum;
	private int last_pageBlock;

}
