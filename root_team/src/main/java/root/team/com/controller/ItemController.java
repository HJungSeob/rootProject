package root.team.com.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.Setter;
import root.team.com.service.global.GlobalService;
import root.team.com.service.item.ItemService;
import root.team.com.service.seller.SellerService;
import root.team.com.vo.ItemVO;
import root.team.com.vo.SellerVO;

@Controller
@RequestMapping("/item")
public class ItemController {

	@Setter(onMethod_ = { @Autowired })
	ItemService iInsert, iView;
	
	@Setter(onMethod_ = { @Autowired })
	SellerService sGet;

	@Setter(onMethod_ = { @Autowired })
	GlobalService gFileNameUpdate, gDateUpdate;

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

	@GetMapping("/view.do")
	public String view(int i_idx, Model model) {

		ItemVO item = iView.view(i_idx);
		item.setI_modifydate(gDateUpdate.dateUpdate(item.getI_modifydate()));
		item.setI_regdate(gDateUpdate.dateUpdate(item.getI_regdate()));
		SellerVO seller = sGet.getSeller(item.getS_idx());
		
		String[] imgArr = {item.getI_saveimg0(), item.getI_saveimg1(),item.getI_saveimg2(),item.getI_saveimg3(), item.getI_saveimg4()};
		String[] optionArr = {item.getI_option0(), item.getI_option1(), item.getI_option2(), item.getI_option3(), item.getI_option4()};
		model.addAttribute("imgArr", imgArr);
		model.addAttribute("optionArr", optionArr);
		model.addAttribute("item", item);
		model.addAttribute("seller", seller);
		
		return "buyer/service/view";
	}

}
