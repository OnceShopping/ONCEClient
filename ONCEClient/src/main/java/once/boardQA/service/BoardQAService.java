package once.boardQA.service;

import java.util.List;

import once.boardQA.vo.BoardQAVO;

public interface BoardQAService {

	void insertDeptQA(BoardQAVO boardQAVO);

	List<BoardQAVO> selectQnAList(int memNo);

	BoardQAVO selectOneQnA(int boardNo);

	BoardQAVO selectQnAAnswer(int boardNo);

}
