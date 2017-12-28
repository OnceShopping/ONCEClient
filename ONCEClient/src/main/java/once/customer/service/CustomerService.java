package once.customer.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import once.customer.vo.CustomerVO;

public interface CustomerService {
	
	CustomerVO login(CustomerVO customer);
	
	List<CustomerVO> selectAll();

	boolean checkPassword(String id, String password);

	void selectById(String id);

	void modifyCustomer(String id, String password, String telephone, String orderPassword);

	void deleteCustomer(String id);
	
	void join(CustomerVO customer);

	boolean checkId(String id);
	
	CustomerVO autoLogin(String loginId);
	
	boolean checkEmail(String email);
	
	//인증
	String create_key();
	
	//이메일 발송
	void send_mail(CustomerVO customer, String div);

	void approvalCustomer(CustomerVO customer, HttpServletResponse response) throws Exception;
	
	String findId(HttpServletResponse response, String email) throws Exception;
	
	void findPw(HttpServletResponse response, CustomerVO customer) throws Exception;
	
}
