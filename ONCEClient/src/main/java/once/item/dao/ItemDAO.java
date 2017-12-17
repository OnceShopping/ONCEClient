package once.item.dao;

import once.item.vo.ItemVO;
import once.order.vo.OrderDetailVO;

public interface ItemDAO {

	ItemVO getItem(int num);
	String[] getColorList(ItemVO itemVO);
	String[] getSizeList(ItemVO itemVO);
	int checkCnt(OrderDetailVO preOrderDetail);
	
}
