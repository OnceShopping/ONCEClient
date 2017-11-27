package once.customer.service;

import java.util.List;

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
	
	/** 메일 전송
     *  @param subject 제목
     *  @param text 내용
     *  @param from 보내는 메일 주소
     *  @param to 받는 메일 주소
     *  @param filePath 첨부 파일 경로: 첨부파일 없을시 null **/
   // public boolean send(String subject, String text, String from, String to, String filePath);
}
