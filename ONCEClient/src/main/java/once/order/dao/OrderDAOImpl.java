package once.order.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import once.item.vo.ItemContentsVO;

@Repository
public class OrderDAOImpl implements OrderDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

}
