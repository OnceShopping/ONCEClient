package once.shoppingCart.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import once.item.vo.ItemContentsVO;
import once.shoppingCart.dao.ShoppingCartDAO;

@Service
public class ShoppingCartServiceImpl implements ShoppingCartService {

	@Autowired
	private ShoppingCartDAO dao;

	// 장바구니에 아이템 담기
	public ItemContentsVO addCartItem(ItemContentsVO detail) { 
	
		ItemContentsVO addItem = dao.addCartItem(detail);
		
		return addItem;
	}

}
