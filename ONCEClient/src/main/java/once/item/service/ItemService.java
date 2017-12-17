package once.item.service;

import java.util.List;

import once.item.vo.ItemVO;
import once.order.vo.OrderDetailVO;

public interface ItemService {

	ItemVO getItem(int num);
	String[] getColorList(ItemVO itemVO);
	String[] getSizeList(ItemVO itemVO);
	int checkCnt(OrderDetailVO preOrderDetail);
}
