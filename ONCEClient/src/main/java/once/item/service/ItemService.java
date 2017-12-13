package once.item.service;

import java.util.List;
import java.util.Map;

import once.item.vo.ItemVO;

public interface ItemService {

	ItemVO getItem(int num);
	String[] getColorList(ItemVO itemVO);
	String[] getSizeList(ItemVO itemVO);
	List<ItemVO> selectStoreMainItem(String storeNo);
	List<ItemVO> selectStoreSearchItem(Map<String, String> searchItem);
	
}
