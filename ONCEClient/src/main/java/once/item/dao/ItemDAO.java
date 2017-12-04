package once.item.dao;

import once.item.vo.ItemVO;

public interface ItemDAO {

	ItemVO getItem(int num);
	String[] getColorList(ItemVO itemVO);
	String[] getSizeList(ItemVO itemVO);
	
}
