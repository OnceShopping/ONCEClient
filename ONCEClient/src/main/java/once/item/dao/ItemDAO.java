package once.item.dao;

import java.util.List;
import once.item.vo.ItemVO;

public interface ItemDAO {

	List<ItemVO> selectItemList();

	List<ItemVO> selectItemList2();

	List<ItemVO> selectItemList3();

	List<ItemVO> selectItemList4();

	List<ItemVO> selectMenItemList();

	List<ItemVO> selectMenItemList2();

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

  String[] getColorList(ItemVO itemVO);
	
  String[] getSizeList(ItemVO itemVO);

}
