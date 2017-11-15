package once.customer.control;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;

import once.customer.service.CustomerService;
import once.customer.vo.CustomerVO;


@Controller
public class CustomerController {

	@Autowired
	private CustomerService service;
	
	@RequestMapping(value="/login/login", method=RequestMethod.GET)
	public String login(CustomerVO customer, @CookieValue(value="saveId", required=false)Cookie sCookie, Model model) {
				
		String id="";
		
		if(sCookie!=null) {
			id=sCookie.getValue();
			customer.setSaveId(true);
		}
		
		customer.setId(id);
		System.out.println(id);
		
		model.addAttribute("customer", customer);
		
		return "login/loginForm";
	}
	
	@RequestMapping(value="/login/login", method=RequestMethod.POST)
	public String loginProcess(CustomerVO customer, Model model, HttpServletResponse response, HttpSession session) {
		String returnURL = "";
				
		CustomerVO loginVO = service.login(customer);
		
		if(loginVO==null) {
			model.addAttribute("message", "Please check your ID or Password");
			
			returnURL="login/loginFail";
		}else {
			session.setAttribute("loginVO", loginVO);
			
			model.addAttribute("loginVO", loginVO);
			model.addAttribute("message", "환영합니다.");
			
			Cookie sCookie = new Cookie("saveId", loginVO.getId());		//id저장
			Cookie aCookie = new Cookie("autoLogin", loginVO.getId());	//자동로그인
			
			if(customer.isSaveId()) {
				sCookie.setMaxAge(60*60*24*14); // 단위(s) | 14일
				sCookie.setPath("/");
			}else if(customer.isAutoLogin()){
				aCookie.setMaxAge(60*60*24*31); // 단위(s) | 31일
				aCookie.setPath("/");
			}else {
				sCookie.setMaxAge(0);
				aCookie.setMaxAge(0);
			}
			response.addCookie(sCookie);
			response.addCookie(aCookie);
			returnURL="login/loginSuccess";
		}
		
		return returnURL;
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		Object obj = session.getAttribute("loginVO");
		
		if(obj != null) {
			CustomerVO loginVO = (CustomerVO)obj;
			
			session.removeAttribute("loginVO");
			session.invalidate();
		}
		
		Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
        
        if(loginCookie != null){
            loginCookie.setPath("/");
            loginCookie.setMaxAge(0);
            response.addCookie(loginCookie);
        }
		
		System.out.println("로그아웃 성공");
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/mypage/mypageMain")
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