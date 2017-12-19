package once.order.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	
}