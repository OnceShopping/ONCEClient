package once.order.service;

import once.order.vo.OrderVO;

public interface OrderService {

	OrderVO addOrder(OrderVO order);

	void updateFloor(OrderVO order);
	
}