package once.item.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import once.item.dao.ItemDAO;
import once.item.vo.ItemVO;
import once.order.vo.OrderDetailVO;

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
	public int checkCnt(OrderDetailVO preOrderDetail) {
		
		return dao.checkCnt(preOrderDetail);
	}

	
}
