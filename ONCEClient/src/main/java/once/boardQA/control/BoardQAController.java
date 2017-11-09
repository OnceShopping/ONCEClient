package once.boardQA.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import once.boardQA.service.BoardQAService;


@Controller
public class BoardQAController {
	
	@Autowired
	private BoardQAService service;
}
