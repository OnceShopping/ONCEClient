package once.store.service;

import java.util.List;

import once.store.vo.StoreVO;

public interface StoreService {
	
	List<StoreVO> selectStoreList(String floor);

	List<StoreVO> selectStoreListQA(Object object);

	List<StoreVO> selectPopStoreList();

}
