package once.comment.control;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import once.comment.service.CommentService;
import once.comment.vo.CommentVO;

@RequestMapping("/comment")
@RestController
public class CommentController {
	
	@Autowired
	private CommentService service;
	
	//댓글 추가
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public void insert(@ModelAttribute CommentVO comment, HttpSession session) {
		String id = (String)session.getAttribute("id");
		service.selectById(id);
		service.insert(comment);
	}
	
    //댓글 목록 화면
    @RequestMapping(value = "/list" , method = RequestMethod.GET)
    public ModelAndView list(@RequestParam int num, ModelAndView mav){
        List<CommentVO> list = service.list(num);

        mav.setViewName("store/itemDetail");
        mav.addObject("list", list);

        return mav;
    }
    
    //댓글 목록 데이터
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    public List<CommentVO> listJson(@RequestParam int num){
        List<CommentVO> list = service.list(num);
        return list;
    }
}
