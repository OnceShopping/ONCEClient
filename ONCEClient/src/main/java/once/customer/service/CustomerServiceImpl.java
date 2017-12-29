package once.customer.service;

import java.io.PrintWriter;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
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
		//인증키 생성
		customer.setApprovalKey(create_key());
		dao.join(customer);
		send_mail(customer, "join");
	}

	@Override
	public boolean checkId(String id) {
		return dao.checkId(id);
	}

	@Override
	public boolean checkEmail(String email) {
		return dao.checkEmail(email);
	}
	
	//인증키 생성 (랜덤 8자리 수)
	@Override
	public String create_key() {
		String key = "";
		Random rd = new Random();
		
		for(int i = 0 ; i < 8 ; i++) {
			key += rd.nextInt(10);
		}
		return key;
	}

	//이메일 발송
	@Override
	public void send_mail(CustomerVO customer, String div) {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		//보내는 사람 id/pw
		String hostSMTPid = "cjswoskatjr@naver.com";
		String hostSMTPpwd = "022020aa^";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "cjswoskatjr@naver.com";
		String fromName = "ONCE";
		String subject = "";
		String msg = "";

		if(div.equals("join")) {
			// 회원가입 메일 내용
			subject = "ONCE 회원가입 인증 메일입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += customer.getId() + "님 회원가입을 환영합니다.</h3>";
			msg += "<div style='font-size: 130%'>";
			msg += "하단의 인증 버튼 클릭 시 정상적으로 회원가입이 완료됩니다.</div><br/>";
			msg += "<form method='post' action='http://13.124.194.6:8080/ONCEClient/approvalCustomer'>";
			msg += "<input type='hidden' name='email' value='" + customer.getEmail() + "'>";
			msg += "<input type='hidden' name='approvalKey' value='" + customer.getApprovalKey() + "'>";
			msg += "<input type='submit' value='인증'></form><br/></div>";
		} else if(div.equals("findPw")) {
			subject = "ONCE 임시 비밀번호입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += "임시 비밀번호입니다. 비밀번호를 변경하여 사용하세요</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += customer.getPassword() + "</p></div>";
		}
		
		// 받는 사람 E-Mail 주소
		String mail = customer.getEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}

	}

	@Override
	public void approvalCustomer(CustomerVO customer, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if (dao.approvalCustomer(customer) == 0) {
			// 이메일 인증에 실패하였을 경우
			out.println("<script>");
			out.println("alert('잘못된 접근입니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		} else { // 이메일 인증을 성공하였을 경우
			out.println("<script>");
			out.println("alert('인증이 완료되었습니다. 로그인 후 이용하세요.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}
	}

	@Override
	public String findId(HttpServletResponse response, String email) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String id = dao.findId(email);
		
		if (id == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return id;
		}
	}

	@Override
	public void findPw(HttpServletResponse response, CustomerVO customer) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			customer.setPassword(pw);
			// 비밀번호 변경
			dao.updatePw(customer);
			// 비밀번호 변경 메일 발송
			send_mail(customer, "findPw");

	}
}