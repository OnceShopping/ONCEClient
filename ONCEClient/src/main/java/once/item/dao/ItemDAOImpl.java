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
