package once.item.service;

import java.util.List;

import java.util.Map;
import once.item.vo.ItemVO;
import once.order.vo.OrderDetailVO;

public interface ItemService {

	List<ItemVO> selectItemList();

	List<ItemVO> selectItemList2();

	List<ItemVO> selectItemList3();

	List<ItemVO> selectItemList4();

	List<ItemVO> selectMenItemList();

	List<ItemVO> selectmenItemList2();

	List<ItemVO> selectMenItemList3();

	List<ItemVO> selectMenItemList4();

	List<ItemVO> selectWomenItemList();

	List<ItemVO> selectWomenItemList2();

	List<ItemVO> selectWomenItemList3();

	List<ItemVO> selectWomenItemList4();

	List<ItemVO> selectKidItemList();

	List<ItemVO> selectKidItemList2();

	List<ItemVO> selectKidItemList3();

	List<ItemVO> selectKidItemList4();

	ItemVO getItem(int num);

  int checkCnt(OrderDetailVO preOrderDetail);
  
	List<ItemVO> selectStoreMainItem(String storeNo);
  
	List<ItemVO> selectStoreSearchItem(Map<String, String> searchItem);

  String[] getColorList(ItemVO itemVO);
	
  String[] getSizeList(ItemVO itemVO);

}
