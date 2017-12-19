package once.item.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import com.google.gson.Gson;

import once.item.service.ItemService;
import once.store.service.StoreService;
import once.item.vo.ItemVO;
import once.store.vo.StoreVO;
import once.item.vo.ItemContentsVO;

@Controller
public class ItemController {

	@Autowired
	private ItemService service;
	

	@Autowired
	private StoreService Sservice;
	
	@RequestMapping("/")
	public String indexItem (Model model) {
		List<ItemVO> itemList = service.selectItemList();
		model.addAttribute("itemList", itemList);
	    List<ItemVO> itemList2 = service.selectItemList2();
	    model.addAttribute("itemList2", itemList2);
	    List<ItemVO> itemList3 = service.selectItemList3();
	    model.addAttribute("itemList3", itemList3);
	    List<ItemVO> itemList4 = service.selectItemList4();
	    model.addAttribute("itemList4", itemList4);
	    List<StoreVO> popStoreList = Sservice.selectPopStoreList();
	    model.addAttribute("popStoreList", popStoreList);
		
		return "index";
		
	}
	
	@RequestMapping("/menu/men")
	public String menItemList (Model model) {
		List<ItemVO> menItemList = service.selectMenItemList();
		model.addAttribute("menItemList", menItemList);
		List<ItemVO> menItemList2 = service.selectmenItemList2();
		model.addAttribute("menItemList2", menItemList2);
		List<ItemVO> menItemList3 = service.selectMenItemList3();
		model.addAttribute("menItemList3", menItemList3);
		List<ItemVO> menItemList4 = service.selectMenItemList4();
		model.addAttribute("menItemList4", menItemList4);
		
		return "menu/men";
	}
	
	@RequestMapping("/menu/women")
	public String womenItemList (Model model) {
		List<ItemVO> womenItemList = service.selectWomenItemList();
		model.addAttribute("womenItemList", womenItemList);
		List<ItemVO> womenItemList2 = service.selectWomenItemList2();
		model.addAttribute("womenItemList2", womenItemList2);
		List<ItemVO> womenItemList3 = service.selectWomenItemList3();
		model.addAttribute("womenItemList3", womenItemList3);
		List<ItemVO> womenItemList4 = service.selectWomenItemList4();
		model.addAttribute("womenItemList4", womenItemList4);
		
		return "menu/women";
	}
	
	@RequestMapping("/menu/kid")
	public String kidItemList (Model model) {
		List<ItemVO> kidItemList = service.selectKidItemList();
		model.addAttribute("kidItemList", kidItemList);
		List<ItemVO> kidItemList2 = service.selectKidItemList2();
		model.addAttribute("kidItemList2", kidItemList2);
		List<ItemVO> kidItemList3 = service.selectKidItemList3();
		model.addAttribute("kidItemList3", kidItemList3);
		List<ItemVO> kidItemList4 = service.selectKidItemList4();
		model.addAttribute("kidItemList4", kidItemList4);
		
		return "menu/kid";
	}


	@RequestMapping(value = "/item/itemDetail/{storeNo_num}", method = RequestMethod.GET)
	public String view(@PathVariable String storeNo_num, ItemContentsVO itemContentsVO, Model model) {

		String[] array = storeNo_num.split("_");
		
		String storeNo = array[0];
		int num = Integer.parseInt(array[1]);
		
		ItemVO itemVO = service.getItem(num);
		itemVO.setStoreNo(storeNo);
			
		String[] colorList = service.getColorList(itemVO);
		String[] sizeList = service.getSizeList(itemVO);

		itemVO.setColorList(colorList);
		itemVO.setSizeList(sizeList);

		Gson gson = new Gson();
		String itemJSON = gson.toJson(itemVO);
		
		model.addAttribute("itemVO", itemVO);
		model.addAttribute("itemJSON", itemJSON);
		
		return "item/itemDetail";
	}
	
	@RequestMapping(value="/item/itemDetail", method = RequestMethod.GET)
	public ModelAndView showSelect(@RequestParam("itemName") String itemName, @RequestParam("sltColor") String sltColor, @RequestParam("sltSize") String sltSize, @RequestParam("idNo") int idNo, Model model) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("item/itemSelect");
		
		mav.addObject("sltColor", sltColor);
		mav.addObject("sltSize", sltSize);
		mav.addObject("idNo", idNo);
		mav.addObject("itemName", itemName);
				
		return mav;
	}

}
