package once.customer.dao;

import java.util.List;

import once.customer.vo.CustomerVO;

public interface CustomerDAO {

	void join(CustomerVO customer);
	
	CustomerVO login(CustomerVO customer);
	
	List<CustomerVO> selectAll();
	
}
