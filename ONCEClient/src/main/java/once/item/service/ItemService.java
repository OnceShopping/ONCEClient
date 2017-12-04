package once.item.service;

import once.item.vo.ItemVO;

public interface ItemService {

	ItemVO getItem(int num);
	String[] getColorList(ItemVO itemVO);
	String[] getSizeList(ItemVO itemVO);
	
}
