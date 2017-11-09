package once.boardQA.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import once.boardQA.dao.BoardQADAO;

@Service
public class BoardQAServiceImpl implements BoardQAService {
	
	@Autowired
	private BoardQADAO dao;
}
