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
	
	//총 가격 가져오기
	public int selectPrice(int orderNo);
	
	//주문 내역-3개월
	public List<OrderVO> threeMonths(int memNo);
	
	//주문 내역-6개월
	public List<OrderVO> sixMonths(int memNo);
	
	//기간 설정
	public List<OrderVO> setTimes(List<Object> searchDate);
	
	//주문 번호에 대한 가격 정보
	public List<OrderVO> showPrice(int orderNo);
}