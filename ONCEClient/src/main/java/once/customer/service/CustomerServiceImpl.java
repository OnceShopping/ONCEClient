package once.customer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import once.customer.dao.CustomerDAO;
import once.customer.vo.CustomerVO;

@Service
public class CustomerServiceImpl implements CustomerService {
	
	@Autowired
	private CustomerDAO dao;
	
	public CustomerVO login(CustomerVO customer) {
		
		return dao.login(customer);
	
	}
	
	public List<CustomerVO> selectAll(){
		
		List<CustomerVO> list = dao.selectAll();
		
		return list;
	}
	
	public CustomerVO autoLogin(String loginId) {
		return dao.autoLogin(loginId);
	}
}
