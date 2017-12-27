package once.shoppingCart.control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
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

import once.customer.vo.CustomerVO;
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
	@RequestMapping(value = "/shoppingCart/addItem/{storeNo}/{num}", method = RequestMethod.POST)
	public ModelAndView addItem(@PathVariable("storeNo") String storeNo, @PathVariable("num") int num,
			@ModelAttribute ItemVO itemVO, ItemContentsVO itemContentsVO, HttpSession session) {

		List<ItemContentsVO> productList = null; // 해당 id의 물품목록
		List<StoreVO> storeList = null;
		List<ItemContentsVO> failBuyList = new ArrayList<>();
		
		ModelAndView mav = new ModelAndView();
		
		if (session.getAttribute("loginVO") == null) { // 로그인 안된 경우
			mav.addObject("message", "로그인 후 이용해 주세요.");
			mav.setViewName("login/loginFail");			
		} else { // 로그인 된 경우
		
		itemVO.setColorList(itemService.getColorList(itemVO));
		itemVO.setSizeList(itemService.getSizeList(itemVO));

		itemContentsVO.setNum(num);

		Iterator<ItemContentsVO> it = itemContentsVO.getItemDetailList().iterator();

		while (it.hasNext()) {
			ItemContentsVO remove = it.next();

			if (remove.isDelete()) {
				it.remove();
			}
		}
		
		if (session.getAttribute("productList") != null) { // 세션에 장바구니가 있는 경우
			productList = (ArrayList<ItemContentsVO>) session.getAttribute("productList");
		} else { // 세션에 장바구니가 없는 경우
			productList = new ArrayList<>();
		}
		
		int cantCnt = 0;
		
		System.out.println("shoppingController_addItem_list: "+itemContentsVO.getItemDetailList());
				
		for (int i = 0; i < itemContentsVO.getItemDetailList().size(); i++) {
			
			ItemContentsVO detail = itemContentsVO.getItemDetailList().get(i);
			detail.setNum(num);
			
			ItemContentsVO addItem = service.addCartItem(detail);
			StoreVO addStore = storeService.selectStore(storeNo);
			
			if (addStore != null) {
				if (session.getAttribute("storeList") != null) { // 세션에 storeList가 있는 경우
					storeList = (ArrayList<StoreVO>) session.getAttribute("storeList");

					boolean exist = false;

					for (int j = 0; j < storeList.size(); j++) {
						if (storeNo.equals(storeList.get(j).getStoreNo())) {
							exist = true;
							break;
						}
					}

					if (exist == false) {
						storeList.add(addStore);
					}

				} else { // 세션에 storeList가 없는 경우
					storeList = new ArrayList<>();
					storeList.add(addStore);
				}
			}
				
			if (addItem != null) { // 물품이 있는 경우
				addItem.setCount(detail.getCount());
				productList.add(addItem); // 장바구니에 추가
								
			} else { // 물품이 없는 경우
				failBuyList.add(detail);
				cantCnt++;
			}
		}	
			
		if(cantCnt==0) {	// 물품이 모두 있는 경우
			
			session.setAttribute("productList", productList);
			session.setAttribute("storeList", storeList);

			System.out.println("shoppingCart/addItem: " + productList);
			System.out.println("shoppingCart/addItem: " + storeList);

			mav.setViewName("redirect:/mypage/shoppingCart");		
			
		}else {	// 물품이 없는게 있는 경우
			mav = new ModelAndView("order/failBuyModal");
			mav.addObject("failBuyList", failBuyList);
			
			mav.setViewName("mypage/error");		
			}
		}
		
		return mav;
	}

	/**
	 * 장바구니 리스트 보기
	 * 
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/mypage/shoppingCart")
	public String viewCart(@ModelAttribute(value = "orderVO") OrderVO orderVO, Model model, HttpSession session) {
		
		List<ItemContentsVO> productList = null;
		List<StoreVO> storeList = null; // 장바구니에 있는 매장 종류

		if (session.getAttribute("loginVO") == null) { // 로그인 안된 경우
			model.addAttribute("message", "로그인 후 이용해 주세요.");
			return "login/loginFail";
		} else { // 로그인 된 경우
			System.out.println((CustomerVO)session.getAttribute("loginVO"));
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


		return "mypage/shoppingCart";
	}

	@RequestMapping(value = "/shoppingCart/deleteAll", method = RequestMethod.GET)
	public @ResponseBody ModelAndView deleteAll(@RequestParam("loop") int loop, @RequestParam("index") int index,
			HttpSession session) throws JsonParseException, JsonMappingException, IOException {

		List<ItemContentsVO> productList = (ArrayList<ItemContentsVO>) session.getAttribute("productList");
		List<StoreVO> storeList = (ArrayList<StoreVO>) session.getAttribute("storeList");

		String storeNo = storeList.get(loop).getStoreNo();

		Iterator<ItemContentsVO> it = productList.iterator();

		while (it.hasNext()) {
			ItemContentsVO remove = it.next();

			if (storeNo.equals(remove.getStoreNo())) {
				it.remove();
			}
		}

		storeList.remove(loop);

		session.removeAttribute("productList");
		session.removeAttribute("storeList");
		session.removeAttribute("listJSON");
		session.removeAttribute("storeJSON");

		ModelAndView mav = new ModelAndView();

		Gson gson = new Gson();
		String listJSON = gson.toJson(productList);
		String storeJSON = gson.toJson(storeList);
		session.setAttribute("productList", productList);
		session.setAttribute("storeList", storeList);
		session.setAttribute("listJSON", listJSON);
		session.setAttribute("storeJSON", storeJSON);

		mav.setViewName("mypage/cartForm/showForm");
		mav.addObject("productList", productList);
		mav.addObject("storeList", storeList);
		mav.addObject("listJSON", listJSON);
		mav.addObject("storeJSON", storeJSON);

		return mav;
	}

	@RequestMapping(value = "/shoppingCart/deleteOne", method = RequestMethod.GET)
	public @ResponseBody ModelAndView deleteOne(@RequestParam int loop, @RequestParam int index, HttpSession session)
			throws JsonParseException, JsonMappingException, IOException {

		List<ItemContentsVO> productList = (ArrayList<ItemContentsVO>) session.getAttribute("productList");
		List<StoreVO> storeList = (ArrayList<StoreVO>) session.getAttribute("storeList");

		String storeNo = storeList.get(loop).getStoreNo();

		int cnt = 0;

		productList.remove(index);

		for (int i = 0; i < productList.size(); i++) {
			if (storeNo.equals(productList.get(i).getStoreNo())) { // productList에 해당 storeNo의 제품이 있을 때
				++cnt;
			}
		}

		if (cnt == 0) {
			storeList.remove(loop);
		}

		session.removeAttribute("productList");
		session.removeAttribute("storeList");
		session.removeAttribute("listJSON");
		session.removeAttribute("storeJSON");

		ModelAndView mav = new ModelAndView();

		Gson gson = new Gson();
		String listJSON = gson.toJson(productList);
		String storeJSON = gson.toJson(storeList);
		session.setAttribute("productList", productList);
		session.setAttribute("storeList", storeList);
		session.setAttribute("listJSON", listJSON);
		session.setAttribute("storeJSON", storeJSON);

		mav.setViewName("mypage/cartForm/showForm");
		mav.addObject("productList", productList);
		mav.addObject("storeList", storeList);
		mav.addObject("listJSON", listJSON);
		mav.addObject("storeJSON", storeJSON);

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
	public String changeCnt(@RequestParam("index") int index, @RequestParam("count") int count, HttpSession session)
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
	public @ResponseBody ModelAndView oriPriceForm(@RequestParam("loop") int loop, @RequestParam("index") int index, HttpSession session) {

		ModelAndView mav = new ModelAndView();
		List<ItemContentsVO> productList = null;
		ItemContentsVO itemContents = null;

		if (session.getAttribute("productList") != null) { // 세션에 장바구니가 있는 경우
			productList = (ArrayList<ItemContentsVO>) session.getAttribute("productList");
			itemContents = productList.get(index);
		}

		mav.setViewName("mypage/cartForm/oriPriceForm");
		mav.addObject("itemContents", itemContents);
		mav.addObject("loop", loop);
		mav.addObject("index", index);
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
	public @ResponseBody ModelAndView salePriceForm(@RequestParam("loop") int loop, @RequestParam("index") int index, HttpSession session) {

		ModelAndView mav = new ModelAndView();
		List<ItemContentsVO> productList = null;
		ItemContentsVO itemContents = null;

		if (session.getAttribute("productList") != null) { // 세션에 장바구니가 있는 경우
			productList = (ArrayList<ItemContentsVO>) session.getAttribute("productList");
			itemContents = productList.get(index);
		}

		mav.setViewName("mypage/cartForm/salePriceForm");
		mav.addObject("itemContents", itemContents);
		mav.addObject("salePrice", itemContents.getSalePrice());
		mav.addObject("loop", loop);
		mav.addObject("index", index);
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