package once.order.service;

import java.util.List;

import once.order.vo.OrderDetailVO;
import once.order.vo.OrderVO;

public interface OrderService {

	OrderVO addOrder(OrderVO order);

	void updateFloor(OrderVO order);

	//주문 리스트 보기
	public List<OrderVO> showOrderList(int memNo);
	
	//주문 상세 정보
	public List<OrderDetailVO> showDetailList(int orderNo);
}