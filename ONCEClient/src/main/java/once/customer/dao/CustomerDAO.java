package once.customer.dao;

import java.util.List;

import once.customer.vo.CustomerVO;

public interface CustomerDAO {

	void join(CustomerVO customer);
	
	CustomerVO login(CustomerVO customer);
	
	List<CustomerVO> selectAll();

	boolean checkPassword(String id, String password);

	void selectById(String id);

	void modifyCustomer(String id, String password, String telephone, String orderPassword);

	void deleteCustomer(String id);
	
	boolean checkId(String id);
	
	CustomerVO autoLogin(String loginId);

}
