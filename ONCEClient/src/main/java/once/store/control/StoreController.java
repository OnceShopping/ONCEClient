package once.store.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import once.store.service.StoreService;
import once.store.vo.StoreVO;

@Controller
public class StoreController {

	@Autowired
	private StoreService service;

	@RequestMapping("/menu/{floor}")
	public String firstfloor(Model model, @PathVariable String floor) {
		
		List<StoreVO> storeList = service.selectStoreList(floor);
		
		model.addAttribute("storeList", storeList);
		
		return "menu/floor";
	}

/*	@RequestMapping("/menu/2F")
	public String secondfloor() {
		return "menu/2F";
	}

	@RequestMapping("/menu/3F")
	public String thirdfloor() {
		return "menu/3F";
	}*/
}
