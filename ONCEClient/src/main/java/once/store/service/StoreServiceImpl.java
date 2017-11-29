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
}
