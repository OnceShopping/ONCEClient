package once.order.control;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import once.customer.vo.CustomerVO;
import once.item.service.ItemService;
import once.item.vo.ItemContentsVO;
import once.item.vo.ItemVO;
import once.order.service.OrderService;
import once.order.vo.OrderDetailVO;
import once.order.vo.OrderVO;
import once.pickupPlace.service.PickupPlaceService;
import once.pickupPlace.vo.PickupPlaceVO;
import once.shoppingCart.service.ShoppingCartService;
import once.store.service.StoreService;
import once.store.vo.StoreVO;

@Controller
public class OrderController {

	@Autowired
	private OrderService service;

	@Autowired
	private ItemService itemService;

	@Autowired
	private StoreService storeService;

	@Autowired
	private ShoppingCartService shoppingCartService;

	@Autowired
	private PickupPlaceService pickupService;

	private OrderVO order;

	public String getOrderPassword(CustomerVO loginVO) {

		String orderPassword = loginVO.getOrderPassword();

		String[] passwordArray = new String[orderPassword.length()];

		for (int i = 0; i < passwordArray.length; i++) {
			if (i < 2) {
				passwordArray[i] = Character.toString(orderPassword.charAt(i));
			} else {
				passwordArray[i] = "*";
			}
		}

		String secretPassword = Arrays.toString(passwordArray).substring(1).replaceAll(",", "").replace("]", "");

		return secretPassword;
	}

	@Transactional
	public OrderVO orderProcess(OrderVO order) {
		order = service.addOrder(order);
		itemService.minCnt(order);

		return order;
	}

	@RequestMapping(value = "/orderList/addOneItem/{storeNo}/{num}")
	public ModelAndView addOneItem(@PathVariable("storeNo") String storeNo, @PathVariable("num") int num,
			@ModelAttribute ItemVO itemVO, ItemContentsVO itemContentsVO, HttpSession session) {

		List<OrderDetailVO> preOrderList = new ArrayList<>();
		List<StoreVO> preStoreList = new ArrayList<>();
		List<ItemContentsVO> failBuyList = new ArrayList<>();

		ModelAndView mav = new ModelAndView();
		CustomerVO loginVO = null;

		if (session.getAttribute("loginVO") == null) { // 로그인 안된 경우

			mav.addObject("message", "로그인 후 이용해 주세요.");
			mav.setViewName("login/loginFail");

		} else { // 로그인 된 경우
			int cantCnt = 0;
			loginVO = (CustomerVO) session.getAttribute("loginVO");

			Iterator<ItemContentsVO> it = itemContentsVO.getItemDetailList().iterator();

			while (it.hasNext()) {
				ItemContentsVO remove = it.next();
				if (remove.isDelete()) {
					it.remove();
				}
			}

			for (int i = 0; i < itemContentsVO.getItemDetailList().size(); i++) {

				ItemContentsVO detail = itemContentsVO.getItemDetailList().get(i);
				detail.setNum(num);

				ItemContentsVO addItem = shoppingCartService.addCartItem(detail);
				StoreVO addStore = storeService.selectStore(storeNo);

				if (addItem != null) { // 물품이 있는 경우
					addItem.setCount(detail.getCount());
					
					OrderDetailVO preOrder = new OrderDetailVO();

					preOrder.setDetailNo(addItem.getDetailNo());
					preOrder.setColor(addItem.getColor());
					preOrder.setSize(addItem.getSize());
					preOrder.setCount(addItem.getCount());
					preOrder.setDetailNo(addItem.getDetailNo());
					preOrder.setStoreNo(addItem.getStoreNo());
					preOrder.setPrice(addItem.getPrice());
					preOrder.setSalePrice(addItem.getSalePrice());
					preOrder.setStartDate(addItem.getStartDate());
					preOrder.setEndDate(addItem.getEndDate());
					preOrder.setItemName(addItem.getItemName());
					preOrder.setNum(addItem.getNum());
					preOrder.setStoreNo(storeNo);
					preOrder.setStoreName(addStore.getStoreName());
					preOrder.setImgSaveName(addItem.getImgSaveName());

					preOrderList.add(preOrder);
					
				} else { // 물품이 없는 경우
					failBuyList.add(detail);
					cantCnt++;
				}
			}

			if (preOrderList != null) {
				for (int j = 0; j < preOrderList.size(); j++) {
					String eStoreNo = preOrderList.get(j).getStoreNo();
					StoreVO eAddStore = storeService.selectStore(eStoreNo);

					if (preStoreList.size() == 0) {
						preStoreList.add(eAddStore);
					} else {
						for (int k = 0; k < preStoreList.size(); k++) {
							if (eStoreNo.equals(preStoreList.get(k).getStoreNo())) {
								continue;
							} else {
								preStoreList.add(eAddStore);
							}
						}
					}
				}
			}

			if (cantCnt == 0) { // 물품이 모두 있는 경우

				Gson gson = new Gson();
				String preOrderJSON = gson.toJson(preOrderList);
				String preStoreJSON = gson.toJson(preStoreList);

				mav.addObject("preOrderList", preOrderList);
				mav.addObject("preStoreList", preStoreList);
				mav.addObject("preOrderJSON", preOrderJSON);
				mav.addObject("preStoreJSON", preStoreJSON);

				mav.setViewName("order/orderList");

			} else {
				mav = new ModelAndView("order/failBuyModal");
				mav.addObject("failBuyList", failBuyList);

				mav.setViewName("mypage/error");
			}
		}

		return mav;

	}

	@RequestMapping(value = "/orderList/addCartItem", method = RequestMethod.POST)
	public String addCartItem(@ModelAttribute(value = "orderVO") OrderVO orderVO, Model model, HttpSession session) {
		
		String storeNo = orderVO.getStoreNo(); // 현재 storeNo

		List<OrderDetailVO> preOrderList = new ArrayList<>();
		List<StoreVO> preStoreList = new ArrayList<>();
		String secretPassword = null;

		CustomerVO loginVO = null;

		if (session.getAttribute("loginVO") == null) { // 로그인 안된 경우

			model.addAttribute("message", "로그인 후 이용해 주세요.");
			return "mypage/error"; // or "login/login";

		} else { // 로그인 된 경우

			loginVO = (CustomerVO) session.getAttribute("loginVO");

			orderVO.setMemNo(loginVO.getMemNo());

			List<ItemContentsVO> productList = (ArrayList<ItemContentsVO>) session.getAttribute("productList");

			for(int i=0; i<productList.size(); i++) {
				ItemContentsVO addItem = productList.get(i);
				 
				if(addItem.getStoreNo().equals(storeNo)) {
					OrderDetailVO preOrder = new OrderDetailVO();
					
					preOrder.setDetailNo(addItem.getDetailNo());
					preOrder.setColor(addItem.getColor());
					preOrder.setSize(addItem.getSize());
					preOrder.setCount(addItem.getCount());
					preOrder.setDetailNo(addItem.getDetailNo());
					preOrder.setStoreNo(addItem.getStoreNo());
					preOrder.setPrice(addItem.getPrice());
					preOrder.setSalePrice(addItem.getSalePrice());
					preOrder.setStartDate(addItem.getStartDate());
					preOrder.setEndDate(addItem.getEndDate());
					preOrder.setItemName(addItem.getItemName());
					preOrder.setNum(addItem.getNum());
					preOrder.setStoreNo(storeNo);
					preOrder.setStoreName(addItem.getStoreNo());
					preOrder.setImgSaveName(addItem.getImgSaveName());

					preOrderList.add(preOrder);
						
				}
			}
			
			StoreVO addStore = storeService.selectStore(storeNo);
			preStoreList.add(addStore);

			secretPassword = getOrderPassword(loginVO);
		}

		System.out.println("addCartItem_preOrderList: "+preOrderList);
		System.out.println("addCartItem_preStoreList: "+preStoreList);
		
		Gson gson = new Gson();
		String preOrderJSON = gson.toJson(preOrderList);
		String preStoreJSON = gson.toJson(preStoreList);

		model.addAttribute("preOrderList", preOrderList);
		model.addAttribute("preStoreList", preStoreList);
		model.addAttribute("preOrderJSON", preOrderJSON);
		model.addAttribute("preStoreJSON", preStoreJSON);

		List<PickupPlaceVO> infoList = pickupService.getAllInfo();
		model.addAttribute("infoList", infoList);

		model.addAttribute("secretPassword", secretPassword);

		return "order/orderList";
	}

	@RequestMapping(value = "/orderList/payChoice", method = RequestMethod.GET)
	public @ResponseBody ModelAndView payChoice(@RequestParam String payVal) {

		ModelAndView mav = new ModelAndView();

		if (payVal.equals("무통장 입금")) {
			mav.setViewName("order/depositless");
		} else if (payVal.equals("카드 결제")) {
			mav.setViewName("order/creditCard");
		} else if (payVal.equals("휴대폰 입금")) {
			mav.setViewName("order/mobileBill");
		}

		return mav;
	}

	/*
	 * 재고 확인 로직
	 */
	@RequestMapping(value = "/orderList/checkCnt", method = RequestMethod.POST)
	public ModelAndView checkCnt(OrderVO preOrder, HttpSession session) {

		ModelAndView mav = new ModelAndView();

		int[] stocks = new int[preOrder.getOrderDetails().size()];

		boolean[] canBuy = new boolean[preOrder.getOrderDetails().size()];
		int canCnt = 0;
		int cantCnt = 0;

		CustomerVO loginVO = null;
		
		for (int i = 0; i < preOrder.getOrderDetails().size(); i++) {

			stocks[i] = itemService.checkCnt(preOrder.getOrderDetails().get(i)); // 재고

			// preOrderList.size(): 실제 주문 상품 종류 개수
			// preOrderList.get(i).getCount(): 주문하는 개수
			if (preOrder.getOrderDetails().get(i).getCount() > stocks[i]) { // 재고가 없는 경우
				canBuy[i] = false;
				cantCnt++;
			} else { // 재고가 있는 경우
				canBuy[i] = true;
				canCnt++;
			}
		}

		if (canCnt == preOrder.getOrderDetails().size()) { // 모든 상품이 재고가 있는 경우
			loginVO = (CustomerVO) session.getAttribute("loginVO");

			preOrder.setMemNo(loginVO.getMemNo());
			preOrder.setId(loginVO.getId());

			int totalPrice = 0;
			int oriPrice = 0;
			int salePrice = 0;

			for (int i = 0; i < preOrder.getOrderDetails().size(); i++) {
				OrderDetailVO detail = preOrder.getOrderDetails().get(i);

				detail.setPrice(detail.getCount() * detail.getPrice());
				oriPrice += detail.getPrice();

				detail.setSalePrice(detail.getCount() * detail.getSalePrice());
				salePrice = detail.getSalePrice();
				if (salePrice == 0) {
					totalPrice += detail.getPrice();
				} else {
					totalPrice += detail.getSalePrice();
				}
			}

			preOrder.setOriPrice(oriPrice);
			preOrder.setSalePrice(oriPrice - totalPrice);
			preOrder.setTotalPrice(totalPrice);
			preOrder.setCount(preOrder.getOrderDetails().size());

			order = orderProcess(preOrder);

			// 해당 물품 세션 장바구니 지우기
			List<ItemContentsVO> productList = (ArrayList<ItemContentsVO>) session.getAttribute("productList");
			List<StoreVO> storeList = (ArrayList<StoreVO>) session.getAttribute("storeList");
			if (session.getAttribute("productList") != null && session.getAttribute("storeList") != null) {

				for (int i = 0; i < productList.size(); i++) {
					System.out.println("세션 지우기 index_i" + i);
					for (int j = 0; j < preOrder.getOrderDetails().size(); j++) {
						OrderDetailVO detail = preOrder.getOrderDetails().get(j);
						if (productList.get(i).getItemName().equals(detail.getItemName())
								&& productList.get(i).getSize() == detail.getSize()
								&& productList.get(i).getColor() == detail.getColor()) {
							productList.remove(i);
						}
					}
				}

				for (int i = 0; i < storeList.size(); i++) {
					if (storeList.get(i).getStoreNo().equals(preOrder.getStoreNo())) {
						storeList.remove(i);
					}
				}

				session.removeAttribute("productList");
				session.removeAttribute("storeList");
				session.removeAttribute("listJSON");
				session.removeAttribute("storeJSON");

				if (productList.size() != 0 && storeList.size() != 0) {
					Gson gson = new Gson();
					String listJSON = gson.toJson(productList);
					String storeJSON = gson.toJson(storeList);
					session.setAttribute("productList", productList);
					session.setAttribute("storeList", storeList);
					session.setAttribute("listJSON", listJSON);
					session.setAttribute("storeJSON", storeJSON);
				}
			}
			System.out.println("todayCount: "+service.countTodayNotReceipt(loginVO.getMemNo()));
			if(service.countTodayNotReceipt(loginVO.getMemNo())<=1) {	// 오늘 첫 주문 이거나, 오늘 한 주문들을 모두 수령한 경우
				List<PickupPlaceVO> infoList = pickupService.getAllInfo();
				mav.setViewName("order/choiceInfo");
				mav.addObject("infoList", infoList);
			}else {	// 오늘 첫 주문이 아니거나, 오늘 한 주문 중 수령하지 않은 물품이 있는 경우
				String floor = service.getFloor(loginVO);
				order.setFloor(floor);
				service.updateFloor(order);
				String secretPassword = getOrderPassword(loginVO);
				mav.setViewName("order/showInfoNPwd");
				mav.addObject("secretPassword", secretPassword);
				mav.addObject("floor", floor);
			}
			
		} else { // 재고가 없는 상품이 있는 경우
			List<OrderDetailVO> failBuyList = new ArrayList<>();
			int[] canBuyCnt = new int[cantCnt];

			for (int i = 0; i < preOrder.getOrderDetails().size(); i++) {
				if (canBuy[i] == false) { // i: 재고가 없는 상품
					failBuyList.add(preOrder.getOrderDetails().get(i));
					canBuyCnt[i] = itemService.checkCnt(preOrder.getOrderDetails().get(i));
				} else { // i: 재고가 있는 상품
					// 처리 해줄 건지?
				}
			}
			mav.setViewName("order/failBuyModal");
			mav.addObject("failBuyList", failBuyList);
			mav.addObject("canBuyCnt", canBuyCnt);
		}
		
		System.out.println("viewName: "+mav.getViewName());
		
		return mav;
	}

	/*
	 * order table에 -> info floor update
	 * 
	 */
	@RequestMapping(value = "/orderList/showOrderPwd", method = RequestMethod.GET)
	public @ResponseBody ModelAndView showOrderPwd(@RequestParam(value="floor", required=false) String floor, HttpSession session) {
		System.out.println("showOrderPwd()_floor: " + floor);
		System.out.println("showOrderPwd()_order: " + order);

		order.setFloor(floor);

		service.updateFloor(order);

		CustomerVO loginVO = (CustomerVO) session.getAttribute("loginVO");
		String secretPassword = getOrderPassword(loginVO);
		System.out.println("showOrderPwd()_secretPassword" + secretPassword);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("order/showOrderPwd");
		mav.addObject("secretPassword", secretPassword);

		return mav;
	}

	/*
	 * 결재 완료 페이지 연결
	 */
	@RequestMapping(value = "/orderList/paySuccess")
	public String paySuccess(Model model) {
		model.addAttribute("order", order);
		return "order/paySuccess";
	}

	//주문 리스트 보기
	@RequestMapping(value = "/order/status", method=RequestMethod.GET)
	public ModelAndView orderList(HttpSession session) {
		
		CustomerVO login = (CustomerVO)session.getAttribute("loginVO");		
		
		List<OrderVO> orderList = new ArrayList<>();
		
		if(login!=null) {
			orderList = service.showOrderList(login.getMemNo());
			
			for(int i=0; i<orderList.size(); i++) {
				orderList.get(i).setOrderDetails(service.showDetailList(orderList.get(i).getOrderNo()));
				 
				int count = 0;
				for(int j=0; j<orderList.get(i).getOrderDetails().size(); j++) {
					count += orderList.get(i).getOrderDetails().get(j).getCount();
				}
				orderList.get(i).setTotalCount(count);
			}
		}
				
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("orderList", orderList);
		mav.addObject("customer", login);
		mav.setViewName("mypage/orderReceipt/status");	
		
		return mav;
	}
	
	//주문 상세 보기
	@RequestMapping(value="/order/{orderNo}")
	public ModelAndView detailOrder(@PathVariable("orderNo") int orderNo, HttpSession session) {
		
		CustomerVO login = (CustomerVO)session.getAttribute("loginVO");
		
		List<OrderDetailVO> detailList = new ArrayList<>();
		
		if(login!=null)
			detailList = service.showDetailList(orderNo); 					
		
		//총 가격 가져오기
		int totalPrice = service.selectPrice(orderNo); 
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("detailList", detailList);
		mav.addObject("totalPrice", totalPrice);
		mav.addObject("customer", login);
		
		mav.setViewName("mypage/orderReceipt/detail");
		
		return mav;
	}
	
	//주문 내역
	@RequestMapping(value="/mypage/orderHistory")
	public ModelAndView orderHistory(HttpSession session) {
		
		CustomerVO login = (CustomerVO)session.getAttribute("loginVO");	
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/orderHistory/history");
		mav.addObject("customer", login);
		
		return mav;
	}
	
	//기간 설정 - 3개월, 6개월
	@RequestMapping(value="/orderList/months", method = RequestMethod.GET)
	@ResponseBody
	public List<OrderVO> orderMonths(@RequestParam("key") int key, @RequestParam("memNo") int memNo){
				
		List<OrderVO> orderList = new ArrayList<>();
		
		if(key==3)
			orderList = service.threeMonths(memNo);
		else
			orderList = service.sixMonths(memNo);
		
		return orderList;
	}
		
	//주문 내역-기간설정
	@RequestMapping(value="/orderList/setTimes", method = RequestMethod.GET)
	@ResponseBody
	public List<OrderVO> orderTimes(@RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate, @RequestParam("memNo") int memNo) {
			
		List<OrderVO> orderList = new ArrayList<>();
		
		List<Object> searchDate = new ArrayList<>();
		
		searchDate.add(memNo);
		searchDate.add(startDate);
		searchDate.add(endDate);

		orderList = service.setTimes(searchDate);
		
		return orderList;
	}
	
	//주문 상세 보기
	@RequestMapping(value="/orderList/{orderNo}")
	public ModelAndView orderListByNo(@PathVariable("orderNo") int orderNo, HttpSession session) {
		
		CustomerVO login = (CustomerVO)session.getAttribute("loginVO");
		
		List<OrderVO> orderList = new ArrayList<>(); // OrderList 테이블
		List<OrderDetailVO> detailList = new ArrayList<>();
		
		if(login!=null) {
			orderList = service.showPrice(orderNo); //OrderList 테이블에서 해당 주문에 대한 가격 정보를 가져오기 위함
			detailList = service.showDetailList(orderNo); 	
		}	
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("orderList", orderList);	
		mav.addObject("detailList", detailList);
		mav.addObject("customer", login);
		mav.setViewName("mypage/orderHistory/detail");
		
		return mav;
	}
}