package once.store.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import once.store.vo.StoreVO;

@Repository
public class StoreDAOImpl implements StoreDAO {

	@Autowired
	private SqlSessionTemplate sqlSesssion;

	@Override
	public List<StoreVO> selectStoreList(String floor) {

		List<StoreVO> storeList = sqlSesssion.selectList("once.store.dao.StoreDAO.selectAllStore", floor);

		return storeList;
	}

	@Override
	public StoreVO selectStore(String storeNo) {
		StoreVO store = sqlSesssion.selectOne("once.store.dao.StoreDAO.selectStore", storeNo);
		return store;
	}
}
