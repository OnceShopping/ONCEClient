package once.order.service;

import java.util.List;

import once.customer.vo.CustomerVO;
import once.order.vo.OrderDetailVO;
import once.order.vo.OrderVO;

public interface OrderService {

	OrderVO addOrder(OrderVO order);

	void updateFloor(OrderVO order);

	//주문 리스트 보기
	public List<OrderVO> showOrderList(int memNo);
	
	//주문 상세 정보
	public List<OrderDetailVO> showDetailList(int orderNo);
	
	//오늘 주문 & !수령완료 한 주문 개수
	public int countTodayNotReceipt(int memNo);

	// info 확인
	String getFloor(CustomerVO loginVO);
	
}