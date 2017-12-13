package once.store.dao;

import java.util.List;

import once.store.vo.StoreVO;

public interface StoreDAO {
	
	List<StoreVO> selectStoreList(String floor);

	StoreVO selectOneStore(String storeName);

	List<StoreVO> selectStoreListQA();

	List<StoreVO> selectPopStoreList();

}
