package once.notice.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import once.notice.service.NoticeService;
import once.notice.vo.NoticeVO;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService service;
	
	@RequestMapping("/noticeDetail/{noticeNo}")
	public String selectNoticeDetail(@PathVariable int noticeNo, Model model) {
		
		NoticeVO noticeVO = service.selectNoticeDetail(noticeNo);
		model.addAttribute("noticeVO", noticeVO);
		
		return "notice/noticeDetail";
	}
}
