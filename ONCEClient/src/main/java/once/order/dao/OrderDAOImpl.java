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
	
	//총 가격 가져오기
	@Override
	public int selectPrice(int orderNo) {
		return sqlSession.selectOne("once.order.dao.OrderDAO.selectPrice", orderNo);
	}
	
	//주문 내역-3개월
	@Override
	public List<OrderVO> threeMonths(int memNo) {
	
		List<OrderVO> list = sqlSession.selectList("once.order.dao.OrderDAO.threeMonths", memNo);
		
		for(int i=0; i<list.size(); i++)
			list.get(i).setOrderDetails(showDetailList(list.get(i).getOrderNo()));
		return list;
	}
	
	//주문 내역-6개월
	@Override
	public List<OrderVO> sixMonths(int memNo) {
	
		List<OrderVO> list = sqlSession.selectList("once.order.dao.OrderDAO.sixMonths", memNo);
		
		for(int i=0; i<list.size(); i++)
			list.get(i).setOrderDetails(showDetailList(list.get(i).getOrderNo()));
		return list;
	}
	
	//기간 설정
	@Override
	public List<OrderVO> setTimes(List<Object> searchDate) {
		
		List<OrderVO> list = sqlSession.selectList("once.order.dao.OrderDAO.setTimes", searchDate);
		
		for(int i=0; i<list.size(); i++)
			list.get(i).setOrderDetails(showDetailList(list.get(i).getOrderNo()));
		
		return list;
	}
	
	//구매내역 상세보기
	@Override
	public List<OrderVO> showPrice(int orderNo) {
		
		List<OrderVO> list = sqlSession.selectList("once.order.dao.OrderDAO.showPrice", orderNo);
		
		return list;


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