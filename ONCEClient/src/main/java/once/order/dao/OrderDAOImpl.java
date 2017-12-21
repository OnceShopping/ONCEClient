package once.order.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import once.customer.vo.CustomerVO;
import once.order.vo.OrderDetailVO;
import once.order.vo.OrderVO;

@Repository
public class OrderDAOImpl implements OrderDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public OrderVO addOrder(OrderVO order) {
		
		sqlSession.insert("once.order.dao.OrderDAO.addOrder", order);
		int orderNo = sqlSession.selectOne("once.order.dao.OrderDAO.findNum");
		order.setOrderNo(orderNo);
		for(int i=0; i<order.getOrderDetails().size(); i++) {
			OrderDetailVO detail = order.getOrderDetails().get(i);
			detail.setOrderNo(orderNo);
			sqlSession.insert("once.order.dao.OrderDAO.addOrderDetail", detail);
		}
		
		return order;
	}

	@Override
	public void updateFloor(OrderVO order) {
		System.out.println("dao_updateFloor: "+order);
		sqlSession.update("once.order.dao.OrderDAO.updateFloor", order);
	}


	//주문 리스트 보기
	@Override
	public List<OrderVO> showOrderList(int memNo) {
		List<OrderVO> list = sqlSession.selectList("once.order.dao.OrderDAO.showOrderList", memNo);
		
		for(int i=0; i<list.size(); i++)
			list.get(i).setOrderDetails(showDetailList(list.get(i).getOrderNo()));
		return list;
	}

	//주문 상세 정보
	@Override
	public List<OrderDetailVO> showDetailList(int orderNo) {
		List<OrderDetailVO> list = sqlSession.selectList("once.order.dao.OrderDAO.showDetailList", orderNo);
		return list;
	}

	//오늘 주문 & !수령완료 한 주문 개수
	@Override
	public int countTodayNotReceipt(int memNo) {
		return sqlSession.selectOne("once.order.dao.OrderDAO.todayNotReceipt", memNo);
	}

	// info 확인
	@Override
	public String getFloor(CustomerVO loginVO) {
		return sqlSession.selectOne("once.order.dao.OrderDAO.getFloor", loginVO);
	}
}