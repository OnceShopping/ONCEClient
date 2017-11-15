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
	
	@Override
	public boolean checkPassword(String id, String password) {
		return dao.checkPassword(id, password);
	}

	@Override
	public void selectById(String id) {
		dao.selectById(id);
	}

	@Override
	public void modifyCustomer(String id, String password, String telephone, String orderPassword) {
		dao.modifyCustomer(id, password, telephone, orderPassword);
	}

	@Override
	public void deleteCustomer(String id, String password) {
		dao.deleteCustomer(id, password);
	}

}
