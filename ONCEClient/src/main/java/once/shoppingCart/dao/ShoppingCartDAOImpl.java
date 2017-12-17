package once.shoppingCart.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import once.item.vo.ItemContentsVO;

@Repository
public class ShoppingCartDAOImpl implements ShoppingCartDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 장바구니에 아이템 담기
	public ItemContentsVO addCartItem(ItemContentsVO detail) {
		
		ItemContentsVO addItem = sqlSession.selectOne("once.item.dao.ItemDAO.addCartItem", detail);
		
		return addItem;
	}

}