package once.item.service;

import java.util.List;

import java.util.Map;

import once.item.vo.ItemContentsVO;
import once.item.vo.ItemImgVO;
import once.item.vo.ItemVO;
import once.order.vo.OrderDetailVO;
import once.order.vo.OrderVO;

public interface ItemService {

	List<ItemVO> selectItemList();

	List<ItemVO> selectItemList2();

	List<ItemVO> selectItemList3();

	List<ItemVO> selectItemList4();

	List<ItemVO> selectMenItemList();

	List<ItemVO> selectmenItemList2();

	List<ItemVO> selectMenItemList3();

	List<ItemVO> selectWomenItemList();

	List<ItemVO> selectWomenItemList2();

	List<ItemVO> selectWomenItemList3();

	List<ItemVO> selectKidItemList();

	List<ItemVO> selectKidItemList2();

	List<ItemVO> selectKidItemList3();

	ItemVO getItem(int num);

	int checkCnt(OrderDetailVO preOrderDetail);
	
	void minCnt(OrderVO order);

	List<ItemVO> selectStoreMainItem(String storeNo);
  
	List<ItemVO> selectStoreSearchItem(Map<String, String> searchItem);

	ItemContentsVO selectOneItem(int num);

	String selectByStoreNo(String storeNo);

	List<ItemImgVO> selectByNum(int num);
	
	String[] getColorList(int num);

	String[] getSizeList(int num);

	String[] getColorList(ItemVO itemVO);
	
	String[] getSizeList(ItemVO itemVO);

	List<ItemVO> selectGeneralItemList();

	List<ItemVO> selectGeneralItemList2();

	List<ItemVO> selectGeneralItemList3();
}
