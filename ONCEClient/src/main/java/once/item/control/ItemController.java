package once.item.control;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import once.item.service.ItemService;
import once.item.vo.ItemContentsVO;
import once.item.vo.ItemImgVO;
import once.item.vo.ItemVO;
import once.store.service.StoreService;
import once.store.vo.StoreVO;

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


	@RequestMapping(value="/item/{num}", method = RequestMethod.GET)
	public ModelAndView indexItemDetail(@PathVariable int num, ItemContentsVO itemContentsVO) {
		itemContentsVO = service.selectOneItem(num);
		String storeName = service.selectByStoreNo(itemContentsVO.getStoreNo());
		List<ItemImgVO> imgList = service.selectByNum(num);
		List<ItemVO> newItemList = service.selectStoreMainItem(itemContentsVO.getStoreNo());
		
		ItemVO itemVO = new ItemVO();
		
		String[] colorList = service.getColorList(num);
		String[] sizeList = service.getSizeList(num);
		
		itemVO.setColorList(colorList);
		itemVO.setSizeList(sizeList);
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("itemContentsVO", itemContentsVO);
		mav.addObject("itemVO", itemVO);
		mav.addObject("storeName", storeName);
		mav.addObject("imgList", imgList);
		mav.addObject("newItemList", newItemList);
		mav.setViewName("store/itemDetail");
		return mav;
	}
	
	@RequestMapping(value="/store/item/{num}", method = RequestMethod.GET)
	public ModelAndView itemDetail(@PathVariable int num, ItemContentsVO itemContentsVO, Model model) {
		itemContentsVO = service.selectOneItem(num);
		String storeName = service.selectByStoreNo(itemContentsVO.getStoreNo());
		List<ItemImgVO> imgList = service.selectByNum(num);
		List<ItemVO> newItemList = service.selectStoreMainItem(itemContentsVO.getStoreNo());
		
		ItemVO itemVO = new ItemVO();
		
		String[] colorList = service.getColorList(num);
		String[] sizeList = service.getSizeList(num);
		
		itemVO.setColorList(colorList);
		itemVO.setSizeList(sizeList);

		ModelAndView mav = new ModelAndView();
		
		mav.addObject("itemContentsVO", itemContentsVO);
		mav.addObject("itemVO", itemVO);
		mav.addObject("storeName", storeName);
		mav.addObject("imgList", imgList);
		mav.addObject("newItemList", newItemList);
		mav.setViewName("store/itemDetail");
		return mav;
	}
	
	@RequestMapping(value="/store/itemDetail", method = RequestMethod.POST)
	public @ResponseBody ModelAndView showSelect(@RequestParam("itemName") String itemName, @RequestParam("sltColor") String sltColor, @RequestParam("sltSize") String sltSize, @RequestParam("idNo") int idNo, Model model) {
	  
	  ModelAndView mav = new ModelAndView();
	  
	  mav.setViewName("store/itemSelect");
	  
	  mav.addObject("sltColor", sltColor);
	  mav.addObject("sltSize", sltSize);
	  mav.addObject("idNo", idNo);
	  mav.addObject("itemName", itemName);
	            
	  return mav;
	}

	//경희 거
/*
  	@RequestMapping(value = "/item/itemDetail/{storeNo_num}", method = RequestMethod.GET)
	public String view(@PathVariable String storeNo_num, ItemContentsVO itemContentsVO, Model model) {
		String[] array = storeNo_num.split("_");
		
		String storeNo = array[0];
		int num = Integer.parseInt(array[1]);
		
		ItemVO itemVO = service.getItem(num);
			
		itemVO.setColorList(colorList);
		itemVO.setSizeList(sizeList);
		model.addAttribute("itemVO", itemVO);
		
		return "item/itemDetail";
	}
*/

}
