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
	public void deleteCustomer(String id) {
		dao.deleteCustomer(id);
	}

	@Override
	public void join(CustomerVO customer) {
		dao.join(customer);
		
	}

	@Override
	public boolean checkId(String id) {
		return dao.checkId(id);
	}
	

/*
    // org.springframework.mail.javamail.JavaMailSender
    private JavaMailSender javaMailSender;
 
    public void setJavaMailSender(JavaMailSender javaMailSender) {
        this.javaMailSender = javaMailSender;
    }
 
    @Override
    public boolean send(String subject, String text, String from, String to, String filePath) {
        // javax.mail.internet.MimeMessage
        MimeMessage message = javaMailSender.createMimeMessage();
 
        try {
            // org.springframework.mail.javamail.MimeMessageHelper
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
            helper.setSubject(subject);
            helper.setText(text, true);
            helper.setFrom(from);
            helper.setTo(to);
 
            // 첨부 파일 처리
            if (filePath != null) {
                File file = new File(filePath);
                if (file.exists()) {
                    helper.addAttachment(file.getName(), new File(filePath));
                }
            }
 
            javaMailSender.send(message);
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return false;
    }
*/

}
