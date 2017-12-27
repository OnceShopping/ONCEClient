package once.item.control;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import once.customer.service.CustomerService;
import once.customer.vo.CustomerVO;
import once.item.service.ItemService;
import once.item.vo.ItemContentsVO;
import once.item.vo.ItemImgVO;
import once.item.vo.ItemVO;
import once.notice.service.NoticeService;
import once.notice.vo.NoticeVO;
import once.store.service.StoreService;
import once.store.vo.StoreVO;

@Controller
public class ItemController {

	@Autowired
	private ItemService service;

	@Autowired
	private StoreService Sservice;

	@Autowired
	private NoticeService SSservice;
  
  @Autowired
  private CustomerService cusService;
  
  
	@RequestMapping("/")
	public String indexItem (CustomerVO loginVO, HttpServletRequest request, HttpSession session, Model model) throws IOException {
	
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
	
	    List<NoticeVO> noticeList = SSservice.selectNoticeList();
		model.addAttribute("noticeList", noticeList);
	  
	    /* autoLogin 
		  Cookie aCookie = null;
		  String loginId = null;
		    
		    try {
				Cookie[] cookies = request.getCookies();
	
				if (cookies != null && cookies.length > 0) {
					for (int i = 0; i < cookies.length; i++) {
						if (cookies[i].getName().equals("autoLogin")) {
							System.out.println("auto넘어왓니");
							aCookie = cookies[i];
						} else {}
					}
				}
			} catch (Exception e) {
			}
	
			if (aCookie != null && aCookie.getValue() != null) {
				loginId = aCookie.getValue();
				loginVO = cusService.autoLogin(loginId);
				loginVO.setAutoLogin(true);
				loginVO.setId(loginId);
				session.setAttribute("loginVO", loginVO);
			}
		*/
	
		return "index";
		
	}
	
	@RequestMapping("/menu/men")
	public String menItemList (Model model) throws IOException {
		List<ItemVO> menItemList = service.selectMenItemList();
		model.addAttribute("menItemList", menItemList);
				
		List<ItemVO> menItemList2 = service.selectmenItemList2();
		model.addAttribute("menItemList2", menItemList2);
		
		List<ItemVO> menItemList3 = service.selectMenItemList3();
		model.addAttribute("menItemList3", menItemList3);
		
		return "menu/men";
	}
	
	@RequestMapping("/menu/women")
	public String womenItemList (Model model) throws IOException {
		List<ItemVO> womenItemList = service.selectWomenItemList();
		model.addAttribute("womenItemList", womenItemList);
		
		List<ItemVO> womenItemList2 = service.selectWomenItemList2();
		model.addAttribute("womenItemList2", womenItemList2);
		
		List<ItemVO> womenItemList3 = service.selectWomenItemList3();
		model.addAttribute("womenItemList3", womenItemList3);
		
		return "menu/women";
	}
	
	@RequestMapping("/menu/kid")
	public String kidItemList (Model model) throws IOException {
		List<ItemVO> kidItemList = service.selectKidItemList();
		model.addAttribute("kidItemList", kidItemList);
		
		List<ItemVO> kidItemList2 = service.selectKidItemList2();
		model.addAttribute("kidItemList2", kidItemList2);
		
		List<ItemVO> kidItemList3 = service.selectKidItemList3();
		model.addAttribute("kidItemList3", kidItemList3);
		
		return "menu/kid";
	}
	
	@RequestMapping("/menu/general")
	 public String generalItemList(Model model) throws IOException {
		
		List<ItemVO> generalItemList = service.selectGeneralItemList();
		model.addAttribute("generalItemList", generalItemList);
		
		List<ItemVO> generalItemList2 = service.selectGeneralItemList2();
		model.addAttribute("generalItemList2", generalItemList2);
		
		List<ItemVO> generalItemList3 = service.selectGeneralItemList3();
		model.addAttribute("generalItemList3", generalItemList3);
		
		return "menu/general";
	}


	@RequestMapping(value="/item/{num}", method = RequestMethod.GET)
	public ModelAndView indexItemDetail(@PathVariable int num, ItemContentsVO itemContentsVO) {
		itemContentsVO = service.selectOneItem(num);
		System.out.println("index_itemContentsVO: " + itemContentsVO);
		String storeName = service.selectByStoreNo(itemContentsVO.getStoreNo());
		List<ItemImgVO> imgList = service.selectByNum(num);
		List<ItemVO> newItemList = service.selectStoreMainItem(itemContentsVO.getStoreNo());
		
		ItemVO itemVO = new ItemVO();
				
		String[] colorList = service.getColorList(num);
		String[] sizeList = service.getSizeList(num);
		
		itemVO.setNum(num);
		itemVO.setColorList(colorList);
		itemVO.setSizeList(sizeList);
		itemVO.setStoreNo(itemContentsVO.getStoreNo());		
		itemVO.setColorList(colorList);
		itemVO.setSizeList(sizeList);
		itemVO.setPrice(itemContentsVO.getPrice());
		itemVO.setSalePrice(itemContentsVO.getSalePrice());
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("itemContentsVO", itemContentsVO);
		mav.addObject("itemVO", itemVO);
		mav.addObject("storeName", storeName);
		mav.addObject("imgList", imgList);
		mav.addObject("newItemList", newItemList);
		
		Gson gson = new Gson();
		String itemJSON = gson.toJson(itemVO);
		
		mav.addObject("itemJSON", itemJSON);
		
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
		
		itemVO = service.getItem(num);
		
		itemVO.setColorList(colorList);
		itemVO.setSizeList(sizeList);
		itemVO.setStoreNo(itemContentsVO.getStoreNo());
		itemVO.setPrice(itemContentsVO.getPrice());
		itemVO.setSalePrice(itemContentsVO.getSalePrice());
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("itemContentsVO", itemContentsVO);
		mav.addObject("itemVO", itemVO);
		mav.addObject("storeName", storeName);
		mav.addObject("imgList", imgList);
		mav.addObject("newItemList", newItemList);
		
		Gson gson = new Gson();
		String itemJSON = gson.toJson(itemVO);
		
		mav.addObject("itemJSON", itemJSON);	
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
	
}