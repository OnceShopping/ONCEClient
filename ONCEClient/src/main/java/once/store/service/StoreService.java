package once.store.service;

import java.util.List;

import once.store.vo.StoreVO;

public interface StoreService {
	
	List<StoreVO> selectStoreList(String floor);

	StoreVO selectStore(String storeNo);	

	StoreVO selectOneStore(String storeName);

	List<StoreVO> selectStoreListQA(Object object);

	List<StoreVO> selectPopStoreList();

}
