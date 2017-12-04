package once.shoppingCart.service;

import once.item.vo.ItemContentsVO;

public interface ShoppingCartService {
	
	// 장바구니에 아이템 담기
	ItemContentsVO addCartItem(ItemContentsVO itemDetail);
	
}
