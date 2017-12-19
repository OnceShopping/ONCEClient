package once.order.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import once.item.vo.ItemContentsVO;
import once.order.dao.OrderDAO;
import once.order.vo.OrderVO;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDAO dao;

	@Override
	public OrderVO addOrder(OrderVO order) {
		order = dao.addOrder(order);	
		return order;
	}

	@Override
	public void updateFloor(OrderVO order) {
		dao.updateFloor(order);
	}

}
