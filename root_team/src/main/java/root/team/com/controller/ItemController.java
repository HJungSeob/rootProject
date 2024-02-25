package root.team.com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.Setter;
import root.team.com.service.item.ItemService;
import root.team.com.vo.ItemVO;

@RestController
@RequestMapping("/item")
public class ItemController {

	@Setter(onMethod_ = { @Autowired })
	ItemService iInsert;
	
	@PostMapping("/writeProcess.do")
	public String writeProcess(@RequestBody ItemVO vo) {

		String viewPage = "seller/service/writetest";// 글등록 실패시 JSP페이지

		int result = iInsert.insert(vo);

		if (result == 1) {
			viewPage = "redirect:/index.do";
		}

		return viewPage;
	}

}
