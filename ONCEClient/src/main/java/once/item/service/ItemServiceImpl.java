package once.item.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import once.item.dao.ItemDAO;
import once.item.vo.ItemVO;

@Service
public class ItemServiceImpl implements ItemService {
	
	@Autowired
	private ItemDAO dao;

	@Override
	public ItemVO getItem(int num) {
		ItemVO itemVO = dao.getItem(num);
		return itemVO;
	}
	 
	@Override
	public String[] getColorList(ItemVO itemVO) {
		String[] colorList = dao.getColorList(itemVO);
		return colorList;
	}

	@Override
	public String[] getSizeList(ItemVO itemVO) {
		String[] sizeList = dao.getSizeList(itemVO);
		return sizeList;
	}

	@Override
	public List<ItemVO> selectStoreMainItem(String storeNo) {
		List<ItemVO> storeItem = dao.selectStoreMainItem(storeNo);
		return storeItem;
	}

	@Override
	public List<ItemVO> selectStoreSearchItem(Map<String, String> searchItem) {
		List<ItemVO> storeItem = dao.selectStoreSearchItem(searchItem);
		return storeItem;
	}

	
}
