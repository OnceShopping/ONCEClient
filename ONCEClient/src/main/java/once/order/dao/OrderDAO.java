package once.order.dao;

import java.util.List;

import once.order.vo.OrderDetailVO;
import once.order.vo.OrderVO;

public interface OrderDAO {

	OrderVO addOrder(OrderVO order);

	void updateFloor(OrderVO order);
	
	//주문 상태 보기
	public List<OrderVO> showOrderList(int memNo);
	
	//주문 상세 정보
	public List<OrderDetailVO> showDetailList(int orderNo);

}
