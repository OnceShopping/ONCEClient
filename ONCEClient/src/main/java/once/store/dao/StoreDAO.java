package once.store.dao;

import java.util.List;

import once.store.vo.StoreVO;

public interface StoreDAO {
	
	List<StoreVO> selectStoreList(String floor);

	StoreVO selectStore(String storeNo);

}
