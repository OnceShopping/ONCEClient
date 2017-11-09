package once.customer.service;

import java.util.List;

import once.customer.vo.CustomerVO;

public interface CustomerService {

	CustomerVO login(CustomerVO customer);
	
	List<CustomerVO> selectAll();
	
}
