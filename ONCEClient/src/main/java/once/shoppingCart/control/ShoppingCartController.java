package once.shoppingCart.control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.google.gson.Gson;

import once.item.service.ItemService;
import once.item.vo.ItemContentsVO;
import once.item.vo.ItemVO;
import once.order.vo.OrderVO;
import once.shoppingCart.service.ShoppingCartService;
import once.store.service.StoreService;
import once.store.vo.StoreVO;

@Controller
public class ShoppingCartController {

	@Autowired
	private ShoppingCartService service;

	@Autowired
	private ItemService itemService;

	@Autowired
	private StoreService storeService;

	/**
	 * 장바구니에 아이템 추가
	 * 
	 * @param itemName
	 * @param itemVO
	 * @param itemContentsVO
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/shoppingCart/addItem/{storeNo}/{num}", method=RequestMethod.POST)
	public String addItem(@PathVariable("storeNo") String storeNo, @PathVariable("num") int num,
			@ModelAttribute ItemVO itemVO, ItemContentsVO itemContentsVO, Model model, HttpSession session) {
		
		List<ItemContentsVO> productList = null; // 해당 id의 물품목록
		List<StoreVO> storeList = null;

		itemVO.setColorList(itemService.getColorList(itemVO));
		itemVO.setSizeList(itemService.getSizeList(itemVO));
		
		itemContentsVO.setNum(num);
		ItemContentsVO addItem = service.addCartItem(itemContentsVO);
		StoreVO addStore = storeService.selectStore(storeNo);

		if (session.getAttribute("loginVO") == null) { // 로그인 안된 경우
			model.addAttribute("message", "로그인 후 이용해 주세요.");
			return "mypage/error"; // or "login/login";
		} else { // 로그인 된 경우

			if (session.getAttribute("productList") != null) { // 세션에 장바구니가 있는 경우
				productList = (ArrayList<ItemContentsVO>) session.getAttribute("productList");
			} else { // 세션에 장바구니가 없는 경우
				productList = new ArrayList<>();
			}
			
			if(addStore!=null) {
				if (session.getAttribute("storeList") != null) { // 세션에 storeList가 있는 경우
					storeList = (ArrayList<StoreVO>) session.getAttribute("storeList");
					
					boolean exist = false;
					
					for (int i = 0; i < storeList.size(); i++) {
						if (storeNo.equals(storeList.get(i).getStoreNo())) {
							exist = true;
							break;
						}
					}
					
					if(exist==false) {
						storeList.add(addStore);
					}
					
				} else { // 세션에 storeList가 없는 경우
					storeList = new ArrayList<>();
					storeList.add(addStore);
				}
			}			

			if (addItem != null) { // 물품이 있는 경우
				
				addItem.setCount(itemContentsVO.getCount());
				productList.add(addItem); // 장바구니에 추가

			} else { // 물품이 없는 경우
				System.out.println("물품이 db에 없습니다.");
				model.addAttribute("message", "물품이 db에 없습니다.");

				return "mypage/error";
			}
			
		}

		session.setAttribute("productList", productList);
		session.setAttribute("storeList", storeList);
		
		System.out.println("shoppingCart/addItem: "+productList);
		System.out.println("shoppingCart/addItem: "+storeList);

		return "redirect:/mypage/shoppingCart";
	}

	/**
	 * 장바구니 리스트 보기
	 * 
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/mypage/shoppingCart")
	public String viewCart(@ModelAttribute(value="orderVO") OrderVO orderVO, Model model, HttpSession session) {

		List<ItemContentsVO> productList = null;
		List<StoreVO> storeList = null; // 장바구니에 있는 매장 종류

		if (session.getAttribute("loginVO") == null) { // 로그인 안된 경우
			model.addAttribute("message", "로그인 후 이용해 주세요.");
			return "mypage/error";
		} else { // 로그인 된 경우
			if (session.getAttribute("productList") != null) { // 세션에 장바구니가 있는 경우
				productList = (ArrayList<ItemContentsVO>) session.getAttribute("productList");
				if (session.getAttribute("storeList") != null) { // 세션에 storeList가 있는 경우
					storeList = (ArrayList<StoreVO>) session.getAttribute("storeList");
				} else {
					storeList = new ArrayList<>();
				}

			} else { // 세션에 장바구니가 없는 경우
				productList = new ArrayList<>();
			}

			Gson gson = new Gson();
			String listJSON = gson.toJson(productList);
			String storeJSON = gson.toJson(storeList);

			session.setAttribute("productList", productList);
			session.setAttribute("listJSON", listJSON);
			session.setAttribute("storeList", storeList);
			session.setAttribute("storeJSON", storeJSON);
		}
		
		System.out.println("mypage/shoppingCart: "+productList);
		System.out.println("mypage/shoppingCart: "+storeList);

		return "mypage/shoppingCart";
	}

	/**
	 * 장바구니 물품 삭제
	 * 
	 * @param index
	 * @param session
	 * @return
	 * @throws JsonParseException
	 * @throws JsonMappingException
	 * @throws IOException
	 */
	@RequestMapping(value = "/shoppingCart/deleteOne", method = RequestMethod.GET)
	public @ResponseBody ModelAndView deleteOne(@RequestParam int loop, @RequestParam int index, HttpSession session)
			throws JsonParseException, JsonMappingException, IOException {

		List<ItemContentsVO> productList = (ArrayList<ItemContentsVO>) session.getAttribute("productList");
		List<StoreVO> storeList = (ArrayList<StoreVO>) session.getAttribute("storeList");

		String storeNo = storeList.get(loop).getStoreNo();
		
		boolean storeExit = true;
		int i =0;
		
		String listJSON = null;
		String storeJSON = null;
		
		productList.remove(index);

		for (;i < productList.size(); i++) {
			if (!storeNo.equals(productList.get(i).getStoreNo())) { // productList에 해당 storeNo의 제품이 없을 때
				storeExit = false;
			}
		}
		
		if(!storeExit) {
			storeList.remove(loop);
		}

		Gson gson = new Gson();
		listJSON = gson.toJson(productList);
		storeJSON = gson.toJson(storeList);

		ModelAndView mav = new ModelAndView();
		
		mav.addObject("productList", productList);
		mav.addObject("storeList", storeList);		
		mav.addObject("listJSON", listJSON);
		mav.addObject("storeJSON", storeJSON);
		
		mav.setViewName("mypage/cartForm/showForm");
		
		session.setAttribute("productList", productList);
		session.setAttribute("storeList", storeList);
		session.setAttribute("listJSON", listJSON);
		session.setAttribute("storeJSON", storeJSON);
		
		return mav;
	}
	
	/**
	 * 장바구니 전체 삭제
	 * @param loop
	 * @param session
	 * @return
	 * @throws JsonParseException
	 * @throws JsonMappingException
	 * @throws IOException
	 */
	@RequestMapping(value = "/shoppingCart/deleteAll", method = RequestMethod.GET)
	public @ResponseBody ModelAndView deleteAll(@RequestParam int loop, HttpSession session) throws JsonParseException, JsonMappingException, IOException {
		
		List<ItemContentsVO> productList = (ArrayList<ItemContentsVO>) session.getAttribute("productList");
		List<StoreVO> storeList = (ArrayList<StoreVO>) session.getAttribute("storeList");
		String storeNo = storeList.get(loop).getStoreNo();
		String listJSON = null;
		String storeJSON = null;
						
		for (int i=0;i < productList.size(); i++) {
			if (storeNo.equals(productList.get(i).getStoreNo())) { // productList에 해당 storeNo의 제품이 있으면
				productList.remove(i);
			}
		}
		storeList = new ArrayList<>();
		
		if (productList != null) {
			for (int i = 0; i < productList.size(); i++) {
				storeNo = productList.get(i).getStoreNo();
				StoreVO addStore = storeService.selectStore(storeNo);
				storeList.add(addStore);
			}
		}
		
		Gson gson = new Gson();
		listJSON = gson.toJson(productList);
		storeJSON = gson.toJson(storeList);

		ModelAndView mav = new ModelAndView();
		
		session.setAttribute("productList", productList);
		session.setAttribute("storeList", storeList);
		session.setAttribute("listJSON", listJSON);
		session.setAttribute("storeJSON", storeJSON);
		
		mav.addObject("productList", productList);
		mav.addObject("storeList", storeList);		
		mav.addObject("listJSON", listJSON);
		mav.addObject("storeJSON", storeJSON);
		
		mav.setViewName("mypage/cartForm/showForm");
				
		return mav;
	}

	/**
	 * 물품 수량 변경(ajax)
	 * 
	 * @param count
	 * @param index
	 * @param session
	 * @return
	 * @throws JsonParseException
	 * @throws JsonMappingException
	 * @throws IOException
	 */
	@RequestMapping(value = "/shoppingCart/changeCnt", method = RequestMethod.GET)
	@ResponseBody
	public String changeCnt(@RequestParam int count, @RequestParam int index, HttpSession session)
			throws JsonParseException, JsonMappingException, IOException {

		List<ItemContentsVO> productList = null;
		String newJsonList = null;

		if (session.getAttribute("productList") != null) { // 세션에 장바구니가 있는 경우
			productList = (ArrayList<ItemContentsVO>) session.getAttribute("productList");

			ItemContentsVO changeItem = productList.get(index);

			changeItem.setCount(count);

			productList.set(index, changeItem);

			Gson gson = new Gson();
			newJsonList = gson.toJson(productList);

		} else { // 세션에 장바구니가 없는 경우 - 에러
			System.out.println("오류");
		}
		return newJsonList;
	}

	/**
	 * 수량 변경에 따른 물품 정상가 변경(ajax)
	 * 
	 * @param index
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/shoppingCart/oriPriceForm")
	public @ResponseBody ModelAndView oriPriceForm(@RequestParam int index, HttpSession session) {

		ModelAndView mav = new ModelAndView();
		List<ItemContentsVO> productList = null;
		ItemContentsVO itemContents = null;

		if (session.getAttribute("productList") != null) { // 세션에 장바구니가 있는 경우
			productList = (ArrayList<ItemContentsVO>) session.getAttribute("productList");
			itemContents = productList.get(index);
		}

		mav.setViewName("mypage/cartForm/oriPriceForm");
		mav.addObject("itemContents", itemContents);
		return mav;
	}

	/**
	 * 수량 변경에 따른 물품 할인가 변경(ajax)
	 * 
	 * @param index
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/shoppingCart/salePriceForm")
	public @ResponseBody ModelAndView salePriceForm(@RequestParam int index, HttpSession session) {

		ModelAndView mav = new ModelAndView();
		List<ItemContentsVO> productList = null;
		ItemContentsVO itemContents = null;

		if (session.getAttribute("productList") != null) { // 세션에 장바구니가 있는 경우
			productList = (ArrayList<ItemContentsVO>) session.getAttribute("productList");
			itemContents = productList.get(index);
		}

		mav.setViewName("mypage/cartForm/salePriceForm");
		mav.addObject("itemContents", itemContents);
		return mav;
	}

	/**
	 * 물품 옵션 보여주기(ajax)
	 * 
	 * @param index
	 * @param session
	 * @return
	 * @throws JsonParseException
	 * @throws JsonMappingException
	 * @throws IOException
	 */
	@RequestMapping(value = "/shoppingCart/showOption", method = RequestMethod.GET)
	@ResponseBody
	public String showOption(@RequestParam int index, HttpSession session)
			throws JsonParseException, JsonMappingException, IOException {

		List<ItemContentsVO> productList = null;

		String optionJSON = null;

		if (session.getAttribute("productList") != null) { // 세션에 장바구니가 있는 경우
			productList = (ArrayList<ItemContentsVO>) session.getAttribute("productList");

			ItemContentsVO showItem = productList.get(index);

			ItemVO changeItem = new ItemVO();
			changeItem.setNum(showItem.getNum());

			String[] colorList = itemService.getColorList(changeItem);
			String[] sizeList = itemService.getSizeList(changeItem);

			changeItem.setColorList(colorList);
			changeItem.setSizeList(sizeList);

			Gson gson = new Gson();
			optionJSON = gson.toJson(changeItem);

		} else {
			System.out.println("오류");
		}
		return optionJSON;
	}

	/**
	 * 물품 옵션 변경(ajax)
	 * 
	 * @param index
	 * @param colorSelect
	 * @param sizeSelect
	 * @param session
	 * @return
	 * @throws JsonParseException
	 * @throws JsonMappingException
	 * @throws IOException
	 */
	@RequestMapping(value = "/shoppingCart/changeOption", method = RequestMethod.GET)
	public @ResponseBody String changeOption(@RequestParam int index, @RequestParam("colorSelect") String colorSelect,
			@RequestParam("sizeSelect") String sizeSelect, HttpSession session)
			throws JsonParseException, JsonMappingException, IOException {

		List<ItemContentsVO> productList = null;

		String newJsonList = null;

		if (session.getAttribute("productList") != null) { // 세션에 장바구니가 있는 경우
			productList = (ArrayList<ItemContentsVO>) session.getAttribute("productList");

			ItemContentsVO changeItem = productList.get(index);

			changeItem.setColor(colorSelect);
			changeItem.setSize(sizeSelect);

			productList.set(index, changeItem);

			Gson gson = new Gson();
			newJsonList = gson.toJson(productList);

		} else {
			System.out.println("오류");
		}

		return newJsonList;
	}

}