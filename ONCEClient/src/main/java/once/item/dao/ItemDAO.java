package once.item.dao;

import java.util.List;
import java.util.Map;

import once.item.vo.ItemContentsVO;
import once.item.vo.ItemImgVO;
import once.item.vo.ItemVO;
import once.order.vo.OrderDetailVO;
import once.order.vo.OrderVO;

public interface ItemDAO {

	ItemVO getItem(int num);
  
	String[] getColorList(ItemVO itemVO);
  
	String[] getSizeList(ItemVO itemVO);
  
	int checkCnt(OrderDetailVO preOrderDetail);
  
	List<ItemVO> selectStoreMainItem(String storeNo);

	List<ItemVO> selectStoreSearchItem(Map<String, String> searchItem);

	List<ItemVO> selectItemList();

	List<ItemVO> selectItemList2();

	List<ItemVO> selectItemList3();

	List<ItemVO> selectItemList4();

	List<ItemVO> selectMenItemList();

	List<ItemVO> selectMenItemList2();

	List<ItemVO> selectMenItemList3();

	List<ItemVO> selectWomenItemList();

	List<ItemVO> selectWomenItemList2();

	List<ItemVO> selectWomenItemList3();

	List<ItemVO> selectKidItemList();

	List<ItemVO> selectKidItemList2();

	List<ItemVO> selectKidItemList3();

	ItemContentsVO selectOneItem(int num);

	String selectByStoreNo(String storeNo);

	List<ItemImgVO> selectByNum(int num);

	String[] getColorList(int num);

	String[] getSizeList(int num);
 
	void minCnt(OrderVO order);

	List<ItemVO> selectGeneralItemList();

	List<ItemVO> selectGeneralItemList2();

	List<ItemVO> selectGeneralItemList3();
}
