package once.item.vo;

import lombok.Data;

@Data
public class ItemContentsVO {
	
	private String storeNo;
	
	private int num;
	private String itemName;
	private int detailNo;
	private String itemNo;
		
	private int price;
	private int salePrice;
	private String startDate;
	private String endDate;
		
	private String size;
	private String color;
	
	private int count;
	
	private String imgOriName;
	private String imgSaveName;
	private int imgSize;
	
}