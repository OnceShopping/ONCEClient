package once.customer.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import once.customer.service.CustomerService;
import once.customer.vo.CustomerVO;

@Controller
public class CustomerController {

	@Autowired
	private CustomerService service;
	
	@RequestMapping(value="/login/login", method=RequestMethod.GET)
	public String login() {
		return "/login";
	}
	
	@RequestMapping(value="/login/login", method=RequestMethod.POST)
	public ModelAndView loginProcess(@RequestParam("id")String id, @RequestParam("password")String password) {
		
		CustomerVO customer = new CustomerVO();
		customer.setId(id);
		customer.setPassword(password);
		
		CustomerVO loginVO = service.login(customer);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login/login");
		mav.addObject("loginVO", loginVO);
		
		return mav;
	}
	
	   @RequestMapping(value="/mypage/mypageMain" )
	   public String mypage() {
	      return "/mypage/mypageMain";
	   }
	   
	   @RequestMapping("/mypage/faq")
	   public String faq() {
		   return "/mypage/faq";
	   }
}
