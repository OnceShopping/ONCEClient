package once.shoppingCart.dao;

import once.item.vo.ItemContentsVO;
import once.item.vo.ItemImgVO;

public interface ShoppingCartDAO {

	//장바구니에 아이템 담기
	ItemContentsVO addCartItem(ItemContentsVO itemDetail);
	
}