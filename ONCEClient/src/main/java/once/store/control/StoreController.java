package once.store.control;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import once.item.service.ItemService;
import once.item.vo.ItemVO;
import once.store.service.StoreService;
import once.store.vo.StoreVO;

@Controller
public class StoreController {

	@Autowired
	private StoreService service;
	
	@Autowired
	private ItemService iService;
	
	@RequestMapping("/menu/{floor}")
	public String firstfloor(Model model, @PathVariable String floor) {
		
		List<StoreVO> storeList = service.selectStoreList(floor);
		model.addAttribute("storeList", storeList);
		model.addAttribute("floor", floor);
		return "menu/floor";
	}
	
	@RequestMapping("/store/{storeName}")
	public ModelAndView selectStore(@PathVariable String storeName) {
		ModelAndView mav = new ModelAndView();
		StoreVO storeVO = service.selectOneStore(storeName);
		
		List<ItemVO> storeItem = iService.selectStoreMainItem(storeVO.getStoreNo());
		
		System.out.println(storeName);
		System.out.println("selectStore_storeVO: "+storeVO);
		System.out.println("selectStore_storeItem: "+storeItem);
		
		mav.addObject("storeVO", storeVO);
		mav.addObject("storeItem", storeItem);
		mav.setViewName("store/storeMain");
		
		return mav;
	}
	
	@RequestMapping("/store/{storeName}/{category2}")
	public ModelAndView storeSelect(@PathVariable String storeName, @PathVariable String category2, @RequestParam(value="", required=false) String order) {
		ModelAndView mav = new ModelAndView();
		Map<String, String> searchItem = new HashMap<>();
		
		StoreVO storeVO = service.selectOneStore(storeName);
		
		String category1 = null;
		//category1 구분 : 대문자를 접하게 되면 나눔
		for (int i = 0; i < category2.length(); i++) {
			if (category2.charAt(i) >= 65 && category2.charAt(i) <= 90) {
				category1 = category2.substring(0, i);
				category2 = category2.substring(i);
				break;
			}
		}
		//검색할때는 대분류, 소분류가 없어서 조건
		if(category1 != null) {
			//대분류 
			switch (category1) {
			case "men":	category1 = "남성";
			searchItem.put("category1", category1);
			break;
			case "women": category1 = "여성";
			searchItem.put("category1", category1);
			break;
			case "boys": category1 = "남아";
			searchItem.put("category1", category1);
			break;
			case "girls": category1 = "여아";
			searchItem.put("category1", category1);
			break;
			}
		}
		//중분류
		switch (category2) {
		case "Clothes": category2 = "의류";
		searchItem.put("category2", category2);
			break;
		case "Shoes": category2 = "신발";
		searchItem.put("category2", category2);
			break;
		case "Accessories": category2 = "잡화";
		searchItem.put("category2", category2);
			break;
		//검색할때, new 일 때
		default :
		searchItem.put("category2", category2);
			break;
		}
		
		searchItem.put("storeNo", storeVO.getStoreNo());
		//select박스 선택된 것
		searchItem.put("order", order);
		List<ItemVO> storeItem = iService.selectStoreSearchItem(searchItem);
		System.out.println(storeItem);
		System.out.println(order);
		
		mav.addObject("storeVO", storeVO);
		mav.addObject("category1", category1);
		mav.addObject("category2", category2);
		mav.addObject("storeItem", storeItem);
		mav.addObject("order", order);
				
		mav.setViewName("store/storeSelect");
		
		return mav;
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
