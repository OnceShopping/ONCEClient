package once.item.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import once.item.dao.ItemDAO;
import once.item.vo.ItemVO;
import once.order.vo.OrderDetailVO;
import once.order.vo.OrderVO;

@Service
public class ItemServiceImpl implements ItemService {
	
	@Autowired
	private ItemDAO dao;

	@Override
	public List<ItemVO> selectItemList() {
		
		List<ItemVO> itemList = dao.selectItemList();
		return itemList;
	}

	@Override
	public List<ItemVO> selectItemList2() {
		
		List<ItemVO> itemList2 = dao.selectItemList2();
		return itemList2;
	}

	@Override
	public List<ItemVO> selectItemList3() {
		
		List<ItemVO> itemList3 = dao.selectItemList3();
		return itemList3;
	}

	@Override
	public List<ItemVO> selectItemList4() {
		
		List<ItemVO> itemList4 = dao.selectItemList4();
		return itemList4;
	}

	@Override
	public List<ItemVO> selectMenItemList() {
		
		List<ItemVO> menItemList = dao.selectMenItemList();
		return menItemList;
	}

	@Override
	public List<ItemVO> selectmenItemList2() {
		
		List<ItemVO> menItemList2 = dao.selectMenItemList2();
		return menItemList2;
	}

	@Override
	public List<ItemVO> selectMenItemList3() {
		
		List<ItemVO> menItemList3 = dao.selectMenItemList3();
		return menItemList3;
	}

	@Override
	public List<ItemVO> selectMenItemList4() {
		
		List<ItemVO> menItemList4 = dao.selectMenItemList4();
		return menItemList4;
	}

	@Override
	public List<ItemVO> selectWomenItemList() {
		
		List<ItemVO> womenItemList = dao.selectWomenItemList();
		return womenItemList;
	}

	@Override
	public List<ItemVO> selectWomenItemList2() {
		
		List<ItemVO> womenItemList2 = dao.selectWomenItemList2();
		return womenItemList2;
	}

	@Override
	public List<ItemVO> selectWomenItemList3() {
		
		List<ItemVO> womenItemList3 = dao.selectWomenItemList3();
		return womenItemList3;
	}

	@Override
	public List<ItemVO> selectWomenItemList4() {
		
		List<ItemVO> womenItemList4 = dao.selectWomenItemList4();
		return womenItemList4;
	}

	@Override
	public List<ItemVO> selectKidItemList() {
		
		List<ItemVO> kidItemList = dao.selectKidItemList();
		return kidItemList;
	}

	@Override
	public List<ItemVO> selectKidItemList2() {
		List<ItemVO> kidItemList2 = dao.selectKidItemList2();
		return kidItemList2;	}

	@Override
	public List<ItemVO> selectKidItemList3() {
		List<ItemVO> kidItemList3 = dao.selectKidItemList3();
		return kidItemList3;	}

	@Override
	public List<ItemVO> selectKidItemList4() {
		List<ItemVO> kidItemList4 = dao.selectKidItemList4();
		return kidItemList4;	}

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
	
	@Override
	public void minCnt(OrderVO order) {
		dao.minCnt(order);
	}
	
}
