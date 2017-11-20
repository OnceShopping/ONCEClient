package once.customer.control;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import once.customer.service.CustomerService;
import once.customer.vo.CustomerVO;

@Controller
public class CustomerController {

	@Autowired
	private CustomerService service;

	public void deleteAllCookie() {
		
	}
	
	@RequestMapping(value = "/login/login", method = RequestMethod.GET)
	public String login(CustomerVO customer, HttpSession session, HttpServletRequest request, Model model) {

		String loginId = "";

		Cookie sCookie = null;

		try {
			Cookie[] cookies = request.getCookies();

			if (cookies != null && cookies.length > 0) {
				for (int i = 0; i < cookies.length; i++) {
					if (cookies[i].getName().equals("saveId")) {
						System.out.println("save넘어왓니");
						sCookie = cookies[i];
					} else {
					}
				}
			}
		} catch (Exception e) {
		}

		if (sCookie != null && sCookie.getValue() != null) {
			loginId = sCookie.getValue();
			System.out.println(sCookie + ": save");
			System.out.println(loginId + ": save");
			customer.setSaveId(true);
			customer.setId(loginId);

		}

		model.addAttribute("customer", customer);

		return "login/loginForm";
	}

	@RequestMapping(value = "/login/login", method = RequestMethod.POST)
	public String loginProcess(CustomerVO customer, Model model, HttpServletResponse response, HttpSession session) {
		String returnURL = "";

		CustomerVO loginVO = service.login(customer);

		System.out.println(loginVO);
		System.out.println(customer);

		if (loginVO == null) {

			model.addAttribute("message", "Please check your ID or Password");
			returnURL = "login/loginFail";

		} else {
			loginVO.setAutoLogin(customer.isAutoLogin());
			loginVO.setSaveId(customer.isSaveId());

			session.setAttribute("loginVO", loginVO);

			model.addAttribute("message", "로그인이 성공적으로 되었습니다. 환영합니다!");

			if (loginVO.isSaveId()) {
				Cookie sCookie = new Cookie("saveId", loginVO.getId()); // id저장
				sCookie.setMaxAge(60 * 60 * 24 * 14); // 단위(s) | 14일
				sCookie.setPath("/");
				response.addCookie(sCookie);
			} else if (loginVO.isAutoLogin()) {
				Cookie aCookie = new Cookie("autoLogin", loginVO.getId()); // 자동로그인
				aCookie.setMaxAge(60 * 60 * 24 * 31); // 단위(s) | 31일
				aCookie.setPath("/");
				response.addCookie(aCookie);
			} else if(!loginVO.isSaveId()){
				Cookie sCookie = new Cookie("saveId", ""); // id저장
				sCookie.setMaxAge(0); // 단위(s) | 14일
				sCookie.setPath("/");
				response.addCookie(sCookie);
			}else {	}

			returnURL = "login/loginSuccess";
		}

		return returnURL;
	}

	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

		// 1. Cookie 통해 loginId만 있는 경우
		String loginId = (String) session.getAttribute("loginId");

		// 2. session에 남아있음
		Object obj = session.getAttribute("loginVO");

		CustomerVO loginVO;

		Cookie[] cookies = request.getCookies();

		if (obj != null) {
			loginVO = (CustomerVO) obj;
			
			if (loginVO.isSaveId()) {
				
				for (int i = 0; i < cookies.length; i++) {

					if (!cookies[i].getName().equals("saveId")) {
						cookies[i].setValue("");
						cookies[i].setMaxAge(0);
						cookies[i].setPath("/");
						
						response.addCookie(cookies[i]);

						System.out.println(cookies[i] + "save Id  뺴고 쿠키 삭제");
					}
				}
			}else {
				
				for (int i = 0; i < cookies.length; i++) {
						cookies[i].setValue("");
						cookies[i].setMaxAge(0);
						cookies[i].setPath("/");
						
						response.addCookie(cookies[i]);

						System.out.println(cookies[i] + "쿠키 전체 삭제");

				}
			}
			
			System.out.println(loginVO);

			session.invalidate();
			System.out.println("세션에 남아 있는거 제거");

		} else if (loginId != null) {
			loginVO = service.autoLogin(loginId);
			
			for (int i = 0; i < cookies.length; i++) {
				cookies[i].setValue("");
				cookies[i].setMaxAge(0);
				cookies[i].setPath("/");
				
				response.addCookie(cookies[i]);

				System.out.println(cookies[i] + "쿠키 전체 삭제");

			}
			
			System.out.println(loginId);

			session.invalidate();
			System.out.println("loginId 제거");

		} else {
			System.out.println("로그인 되어 있지 않음 - 어케 들어옴? 오류");
		}

		System.out.println("로그아웃 성공");

		return "redirect:/";
	}

	@RequestMapping(value = "/mypage/mypageMain")
	public String mypage() {

		return "mypage/mypageMain";
	}

	@RequestMapping("/mypage/faq")
	public String faq() {
		return "mypage/faq";
	}

	@RequestMapping("/menu/1F")
	public String firstfloor() {
		return "menu/1F";
	}

}