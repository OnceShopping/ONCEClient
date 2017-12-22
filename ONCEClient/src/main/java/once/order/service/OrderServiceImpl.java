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
	
	//총 가격 가져오기
	@Override
	public int selectPrice(int orderNo) {
		return dao.selectPrice(orderNo);
	}
	
	//주문 내역-3개월
	@Override
	public List<OrderVO> threeMonths(int memNo) {
		return dao.threeMonths(memNo);
	}
	
	//주문 내역-6개월
	@Override
	public List<OrderVO> sixMonths(int memNo) {
		return dao.sixMonths(memNo);
	}
	
	//기간 설정
	@Override
	public List<OrderVO> setTimes(List<Object> searchDate) {
		return dao.setTimes(searchDate);
	}
	
	//주문 번호에 대한 가격 정보
	@Override
	public List<OrderVO> showPrice(int orderNo) {
		return dao.showPrice(orderNo);
	}
}
