package once.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import once.order.dao.OrderDAO;
import once.order.vo.OrderDetailVO;
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

	//주문 리스트 보기
	@Override
	public List<OrderVO> showOrderList(int memNo) {
		return dao.showOrderList(memNo);
	}
	
	//주문 상세 정보
	@Override
	public List<OrderDetailVO> showDetailList(int orderNo) {
		return dao.showDetailList(orderNo);
	}
}
