package once.boardQA.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import once.boardQA.dao.BoardQADAO;
import once.boardQA.vo.BoardQAVO;

@Service
public class BoardQAServiceImpl implements BoardQAService {
	
	@Autowired
	private BoardQADAO dao;

	@Override
	public void insertDeptQA(BoardQAVO boardQAVO) {
		dao.insertDeptQA(boardQAVO);

	}
}
