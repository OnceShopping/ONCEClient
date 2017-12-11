package once.item.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import once.item.service.ItemService;
import once.item.vo.ItemContentsVO;
import once.item.vo.ItemVO;

@Controller
public class ItemController {

	@Autowired
	private ItemService service;
	
	@RequestMapping(value = "/item/itemDetail/{storeNo_num}", method = RequestMethod.GET)
	public String view(@PathVariable String storeNo_num, ItemContentsVO itemContentsVO, Model model) {

		String[] array = storeNo_num.split("_");
		
		String storeNo = array[0];
		int num = Integer.parseInt(array[1]);
		
		ItemVO itemVO = service.getItem(num);
		itemVO.setStoreNo(storeNo);
			
		String[] colorList = service.getColorList(itemVO);
		String[] sizeList = service.getSizeList(itemVO);

		itemVO.setColorList(colorList);
		itemVO.setSizeList(sizeList);

		model.addAttribute("itemVO", itemVO);
		
		return "item/itemDetail";
	}
}
