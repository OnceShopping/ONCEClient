package once.order.dao;

import once.order.vo.OrderVO;

public interface OrderDAO {

	OrderVO addOrder(OrderVO order);

	void updateFloor(OrderVO order);

}
