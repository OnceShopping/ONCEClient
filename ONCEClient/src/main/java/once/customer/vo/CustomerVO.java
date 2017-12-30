package once.customer.vo;

import lombok.Data;

@Data
public class CustomerVO {
	
	private String id;
	private String password;
	//private String rank;
	private String name;
	private String telephone;
	private int memNo;
	private String date;
	private String orderPassword;

	private boolean autoLogin;
	private boolean saveId;
	
	//인증
	private String approvalStatus;
	private String approvalKey;
	
	private String email;
}