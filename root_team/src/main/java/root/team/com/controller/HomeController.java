package root.team.com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.Setter;
import root.team.com.service.item.ItemService;
import root.team.com.vo.ItemVO;
import root.team.com.vo.SearchVO;

@Controller
public class HomeController {

	@Setter(onMethod_ = { @Autowired })
	ItemService iList;

	@GetMapping("/")
	public String home(Model model) {

		SearchVO categoryA = new SearchVO();
		SearchVO categoryB = new SearchVO();
		SearchVO categoryC = new SearchVO();
		SearchVO categoryD = new SearchVO();
		SearchVO categoryE = new SearchVO();

		categoryA.setP_idx("1");
		categoryB.setP_idx("2");
		categoryC.setP_idx("3");
		categoryD.setP_idx("4");
		categoryE.setP_idx("5");

		List<ItemVO> listA = iList.indexGetItems(categoryA);
		List<ItemVO> listB = iList.indexGetItems(categoryB);
		List<ItemVO> listC = iList.indexGetItems(categoryC);
		List<ItemVO> listD = iList.indexGetItems(categoryD);
		List<ItemVO> listE = iList.indexGetItems(categoryE);
		
		model.addAttribute("listA", listA);
		model.addAttribute("listB", listB);
		model.addAttribute("listC", listC);
		model.addAttribute("listD", listD);
		model.addAttribute("listE", listE);

		return "index";
	}

	@GetMapping("/index.do")
	public String home2(Model model) {

		SearchVO categoryA = new SearchVO();
		SearchVO categoryB = new SearchVO();
		SearchVO categoryC = new SearchVO();
		SearchVO categoryD = new SearchVO();
		SearchVO categoryE = new SearchVO();

		categoryA.setP_idx("1");
		categoryB.setP_idx("2");
		categoryC.setP_idx("3");
		categoryD.setP_idx("4");
		categoryE.setP_idx("5");

		List<ItemVO> listA = iList.indexGetItems(categoryA);
		List<ItemVO> listB = iList.indexGetItems(categoryB);
		List<ItemVO> listC = iList.indexGetItems(categoryC);
		List<ItemVO> listD = iList.indexGetItems(categoryD);
		List<ItemVO> listE = iList.indexGetItems(categoryE);		
		
		model.addAttribute("listA", listA);
		model.addAttribute("listB", listB);
		model.addAttribute("listC", listC);
		model.addAttribute("listD", listD);
		model.addAttribute("listE", listE);

		return "index";
	}

}
