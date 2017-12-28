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
	
	//이메일 인증
	int approvalCustomer(CustomerVO customer);

	boolean checkEmail(String email);
	
	//아이디 찾기
	String findId(String email);
	
	//비밀번호 변경
	int updatePw(CustomerVO customer);

}
