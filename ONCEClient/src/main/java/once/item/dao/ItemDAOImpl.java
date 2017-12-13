package once.item.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import once.item.vo.ItemVO;

@Repository
public class ItemDAOImpl implements ItemDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;


	@Override
	public List<ItemVO> selectItemList() {

		List<ItemVO> itemList = sqlSession.selectList("once.item.dao.ItemDAO.selectMenItem");

		return itemList;
	}

	@Override
	public List<ItemVO> selectItemList2() {

		List<ItemVO> itemList2 = sqlSession.selectList("once.item.dao.ItemDAO.selectWomenItem");

		return itemList2;
	}

	@Override
	public List<ItemVO> selectItemList3() {

		List<ItemVO> itemList3 = sqlSession.selectList("once.item.dao.ItemDAO.selectKidItem");

		return itemList3;
	}

	@Override
	public List<ItemVO> selectItemList4() {

		List<ItemVO> itemList4 = sqlSession.selectList("once.item.dao.ItemDAO.selectGeneralItem");

		return itemList4;
	}

	@Override
	public List<ItemVO> selectMenItemList() {

		List<ItemVO> menItemList = sqlSession.selectList("once.item.dao.ItemDAO.selectMenItemList");

		return menItemList;
	}

	@Override
	public List<ItemVO> selectMenItemList2() {

		List<ItemVO> menItemList2 = sqlSession.selectList("once.item.dao.ItemDAO.selectMenItemList2");

		return menItemList2;
	}

	@Override
	public List<ItemVO> selectMenItemList3() {

		List<ItemVO> menItemList3 = sqlSession.selectList("once.item.dao.ItemDAO.selectMenItemList3");

		return menItemList3;
	}

	@Override
	public List<ItemVO> selectMenItemList4() {

		List<ItemVO> menItemList4 = sqlSession.selectList("once.item.dao.ItemDAO.selectMenItemList4");

		return menItemList4;
	}

	@Override
	public List<ItemVO> selectWomenItemList() {

		List<ItemVO> womenItemList = sqlSession.selectList("once.item.dao.ItemDAO.selectWomenItemList");
		return womenItemList;
	}

	@Override
	public List<ItemVO> selectWomenItemList2() {

		List<ItemVO> womenItemList2 = sqlSession.selectList("once.item.dao.ItemDAO.selectWomenItemList2");
		return womenItemList2;
	}

	@Override
	public List<ItemVO> selectWomenItemList3() {

		List<ItemVO> womenItemList3 = sqlSession.selectList("once.item.dao.ItemDAO.selectWomenItemList3");
		return womenItemList3;
	}

	@Override
	public List<ItemVO> selectWomenItemList4() {

		List<ItemVO> womenItemList4 = sqlSession.selectList("once.item.dao.ItemDAO.selectWomenItemList4");
		return womenItemList4;
	}

	@Override
	public List<ItemVO> selectKidItemList() {
		List<ItemVO> kidItemList = sqlSession.selectList("once.item.dao.ItemDAO.selectKidItemList");
		return kidItemList;
	}

	@Override
	public List<ItemVO> selectKidItemList2() {
		List<ItemVO> kidItemList2 = sqlSession.selectList("once.item.dao.ItemDAO.selectKidItemList2");
		return kidItemList2;
	}

	@Override
	public List<ItemVO> selectKidItemList3() {
		List<ItemVO> kidItemList3 = sqlSession.selectList("once.item.dao.ItemDAO.selectKidItemList3");
		return kidItemList3;
	}

	@Override
	public List<ItemVO> selectKidItemList4() {
		List<ItemVO> kidItemList4 = sqlSession.selectList("once.item.dao.ItemDAO.selectKidItemList4");
		return kidItemList4;
	}

  @Override
	public ItemVO getItem(int num) {
		ItemVO itemVO = sqlSession.selectOne("once.item.dao.ItemDAO.getItem", num);
		return itemVO;
	}
	
	@Override
	public String[] getColorList(ItemVO itemVO) {
		List<String> getColor = sqlSession.selectList("once.item.dao.ItemDAO.getColorList", itemVO);
		String[] colorList = getColor.toArray(new String[getColor.size()]);
		
		return colorList;
	}

	@Override
	public String[] getSizeList(ItemVO itemVO) {
		List<String> getSize = sqlSession.selectList("once.item.dao.ItemDAO.getSizeList", itemVO);
		String[] sizeList = getSize.toArray(new String[getSize.size()]);
		
		return sizeList;
	}

	@Override
	public List<ItemVO> selectStoreMainItem(String storeNo) {
		List<ItemVO> storeItem = sqlSession.selectList("once.item.dao.ItemDAO.storeMainItem", storeNo);
		return storeItem;
	}

	@Override
	public List<ItemVO> selectStoreSearchItem(Map<String, String> searchItem) {
		List<ItemVO> storeItem = sqlSession.selectList("once.item.dao.ItemDAO.storeSelectItem", searchItem);
		return storeItem;
	}
}
