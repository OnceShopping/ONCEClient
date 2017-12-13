package once.store.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import once.store.dao.StoreDAO;
import once.store.vo.StoreVO;

@Service
public class StoreServiceImpl implements StoreService {
	
	@Autowired
	private StoreDAO dao;

	@Override
	public List<StoreVO> selectStoreList(String floor) {
		
		List<StoreVO> storeList = dao.selectStoreList(floor);
		
		return storeList;
	}

	@Override
	public StoreVO selectOneStore(String storeName) {
		return dao.selectOneStore(storeName);
  }
  
	public List<StoreVO> selectStoreListQA(Object object) {
		List<StoreVO> storeListQA = dao.selectStoreListQA();
		return storeListQA;
	}

	@Override
	public List<StoreVO> selectPopStoreList() {
		List<StoreVO> popStoreList = dao.selectPopStoreList();
		return popStoreList;
	}
}
