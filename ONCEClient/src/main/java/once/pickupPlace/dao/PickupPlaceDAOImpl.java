package once.pickupPlace.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import once.pickupPlace.vo.PickupPlaceVO;

@Repository
public class PickupPlaceDAOImpl implements PickupPlaceDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<PickupPlaceVO> getAllInfo() {
		
		List<PickupPlaceVO> list = sqlSession.selectList("once.pickupPlace.dao.PickupPlaceDAO.selectAll");
		
		return list;
	}
}
