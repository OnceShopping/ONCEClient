package once.store.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import once.store.vo.StoreVO;

@Repository
public class StoreDAOImpl implements StoreDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<StoreVO> selectStoreList(String floor) {
		List<StoreVO> storeList = sqlSession.selectList("once.store.dao.StoreDAO.selectAllStore", floor);
		return storeList;
	}

	@Override
	public StoreVO selectOneStore(String storeName) {
		return sqlSession.selectOne("once.store.dao.StoreDAO.selectOneStore", storeName);
  }
  
	public List<StoreVO> selectStoreListQA() {
		List<StoreVO> storeListQA = sqlSession.selectList("once.store.dao.StoreDAO.selectStoreListQA");
		return storeListQA ;
	}

	@Override
	public List<StoreVO> selectPopStoreList() {
		List<StoreVO> popStoreList = sqlSession.selectList("once.store.dao.StoreDAO.selectPopStoreList");
		return popStoreList;
	}

	@Override
	public StoreVO selectStore(String storeNo) {
		StoreVO store = sqlSession.selectOne("once.store.dao.StoreDAO.selectStore", storeNo);
		return store;
	}
}
