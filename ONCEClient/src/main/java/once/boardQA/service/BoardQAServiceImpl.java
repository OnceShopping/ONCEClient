package once.boardQA.service;

import java.util.List;

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

	@Override
	public List<BoardQAVO> selectQnAList(int memNo) {
		
		List<BoardQAVO> qnaList = dao.selectQnAList(memNo);
		return qnaList;
	}

	@Override
	public BoardQAVO selectOneQnA(int boardNo) {
		
		return dao.selectOneQnA(boardNo);
	}

	@Override
	public BoardQAVO selectQnAAnswer(int boardNo) {
		
		return dao.selectQnAAnswer(boardNo);
	}
}
