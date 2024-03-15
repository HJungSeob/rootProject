package root.team.com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.Setter;
import root.team.com.common.PageNav;
import root.team.com.service.global.GlobalService;
import root.team.com.service.item.ItemService;
import root.team.com.vo.ItemVO;
import root.team.com.vo.ReviewVO;
import root.team.com.vo.SearchVO;

@Controller
@RequestMapping("/item")
public class ItemController {

	@Setter(onMethod_ = { @Autowired })
	ItemService iInsert, iView, iList, iTotalCount, iReviewList, iReviewInsert, iReviewTotalCount, iDelete;

	@Setter(onMethod_ = { @Autowired })
	GlobalService gFileNameUpdate, gDateUpdate, gPage;

	@Setter(onMethod_ = { @Autowired })
	PageNav pageNav;

	@GetMapping("/write.do")
	public String write() {
		return "seller/service/write";
	}

	@PostMapping("/writeProcess.do")
	public String writeProcess(ItemVO vo, HttpServletRequest request) {

		String viewPage = "seller/service/write";// 글등록 실패시 JSP페이지

		String saveDirectory = request.getServletContext().getRealPath("resources/uploads/");
		try {
			vo.setI_saveimg0(gFileNameUpdate.fileNameUpdate(vo.getI_img0(), saveDirectory));
			vo.setI_saveimg1(gFileNameUpdate.fileNameUpdate(vo.getI_img1(), saveDirectory));
			vo.setI_saveimg2(gFileNameUpdate.fileNameUpdate(vo.getI_img2(), saveDirectory));
			vo.setI_saveimg3(gFileNameUpdate.fileNameUpdate(vo.getI_img3(), saveDirectory));
			vo.setI_saveimg4(gFileNameUpdate.fileNameUpdate(vo.getI_img4(), saveDirectory));
		} catch (NullPointerException e) {
		}

		int result = iInsert.insert(vo);

		if (result == 1) {
			viewPage = "redirect:/seller/dashBoard.do";
		}
		return viewPage;
	}

	@GetMapping("/list.do")
	public String list(@ModelAttribute("sVO") SearchVO searchVO, Model model) {

		if (searchVO.getPageNum() == 0) {
			searchVO.setPageNum(1);
		}

		if (searchVO.getSearchField() == null) {
			searchVO.setSearchField("i_name");
		}
		
		if (searchVO.getViewNum() == 0) {
			searchVO.setViewNum(9);
		}

		if (searchVO.getOrderByType() == null) {
			searchVO.setOrderByType("pop");
		}

		List<ItemVO> itemList = iList.getItems(searchVO);
		model.addAttribute("itemList", itemList);

		pageNav.setTotalRows(iTotalCount.getTotalCount(searchVO));
		pageNav = gPage.setPageNav(pageNav, searchVO.getPageNum(), searchVO.getPageBlock(), searchVO.getViewNum());
		model.addAttribute("pageNav", pageNav);

		return "buyer/service/list";
	}

	@GetMapping("/view.do")
	public String view(@ModelAttribute("sVO") SearchVO searchVO, Model model) {
		
		ItemVO item = iView.view(searchVO.getI_idx());
		List<ReviewVO> reviewList = iReviewList.reviewList(searchVO);
		int point5 = 0;
		int point4 = 0;
		int point3 = 0;
		int point2 = 0;
		int point1 = 0;
		if (reviewList != null) {
			for (int i = 0; i < reviewList.size(); i++) {
				switch (reviewList.get(i).getBr_star()) {
				case 5: point5++;		
					break;
				case 4: point4++;
					break;
				case 3: point3++;
					break;
				case 2: point2++;
					break;
				case 1: point1++;
					break;
				}
			}
		}
		
		item.setI_modifydate(gDateUpdate.dateUpdate(item.getI_modifydate()));
		item.setI_regdate(gDateUpdate.dateUpdate(item.getI_regdate()));
		String[] imgArr = { item.getI_saveimg0(), item.getI_saveimg1(), item.getI_saveimg2(), item.getI_saveimg3(),
				item.getI_saveimg4() };
		String[] optionArr = { item.getI_option0(), item.getI_option1(), item.getI_option2(), item.getI_option3(),
				item.getI_option4() };
		int[] starArr = { point5, point4, point3, point2, point1};
		model.addAttribute("imgArr", imgArr);
		model.addAttribute("optionArr", optionArr);
		model.addAttribute("item", item);				
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("starArr", starArr);

		return "buyer/service/view";
	}
	
	@PostMapping("/insertReview.do")
	@ResponseBody
	public int insertReview(ReviewVO ReviewVO) {	
		return iReviewInsert.insertReview(ReviewVO);	
	}

	@PostMapping("/deleteItemProcess.do")
	@ResponseBody
	public int deleteItemProcess(int i_idx) {
		return iDelete.deleteItem(i_idx);
	}
}
