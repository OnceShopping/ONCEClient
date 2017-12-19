package once.boardQA.control;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import once.boardQA.service.BoardQAService;
import once.boardQA.vo.BoardQAVO;
import once.customer.vo.CustomerVO;
import once.store.service.StoreService;
import once.store.vo.StoreVO;


@Controller
public class BoardQAController {

	@Autowired
	private BoardQAService service;
	
	@Autowired
	private StoreService Sservice;

	@RequestMapping("/mypage/myqna")
	public String myqna(Model model, HttpSession session) {
		CustomerVO loginVO = (CustomerVO)session.getAttribute("loginVO");
		
		int memNo = loginVO.getMemNo();
		
		List<BoardQAVO> qnaList = service.selectQnAList(memNo);
		model.addAttribute("qnaList", qnaList);
		System.out.println(qnaList);
		return "mypage/myqna";
	}

	@RequestMapping("/mypage/writeForm/{category1}")
	public String writeForm(Model model, @PathVariable String category1) {
		if (category1.equals("Dept"))
			category1 = "백화점";
		else if (category1.equals("Store")) {
			category1 = "매장";
			List<StoreVO> storeListQA = Sservice.selectStoreListQA(null);
			model.addAttribute("storeListQA", storeListQA);
		}
		model.addAttribute("category1", category1);
		return "mypage/writeForm";
	}
	
	@RequestMapping("/insertDeptQA")
	public String insertDept(HttpServletRequest request, HttpSession session) {
		                               
		BoardQAVO boardQAVO = new BoardQAVO();
		boardQAVO.setCategory1(request.getParameter("category1"));
		if (request.getParameter("category2")!=null)
			boardQAVO.setCategory2(request.getParameter("category2"));
		else
			boardQAVO.setCategory2(request.getParameter("category1"));
		boardQAVO.setCategory3(request.getParameter("category3"));
		boardQAVO.setTitle(request.getParameter("title"));
		boardQAVO.setContent(request.getParameter("content"));
		
		CustomerVO loginVO = (CustomerVO)session.getAttribute("loginVO");
		boardQAVO.setWriter(loginVO.getId());
		boardQAVO.setMemNo(loginVO.getMemNo());
		service.insertDeptQA(boardQAVO);
		return "redirect:/mypage/myqna";
	}
	
	@RequestMapping("/qnaDetail/{boardNo}")
	public String selectQnA(@PathVariable int boardNo, Model model) {
		
		BoardQAVO boardQAVO = service.selectOneQnA(boardNo);
		model.addAttribute("boardQAVO", boardQAVO);
		BoardQAVO boardQAVO2 = service.selectQnAAnswer(boardNo);
		model.addAttribute("boardQAVO2", boardQAVO2);
		
		return "mypage/qnaDetail";
	}
	
}
