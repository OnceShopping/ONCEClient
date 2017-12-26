package once.boardQA.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import once.boardQA.vo.BoardQAVO;

@Repository
public class BoardQADAOImpl implements BoardQADAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public void insertDeptQA(BoardQAVO boardQAVO) {
		sqlSession.insert("once.boardQA.dao.BoardQADAO.insertDeptQA", boardQAVO);
		
		
	}

	@Override
	public List<BoardQAVO> selectQnAList(int memNo) {
		
		List<BoardQAVO> qnaList = sqlSession.selectList("once.boardQA.dao.BoardQADAO.selectQnAList", memNo);
		return qnaList;
	}

	@Override
	public BoardQAVO selectOneQnA(int boardNo) {
		
		return sqlSession.selectOne("once.boardQA.dao.BoardQADAO.selectOneQnA", boardNo);
	}

	@Override
	public BoardQAVO selectQnAAnswer(int boardNo) {
		
		return sqlSession.selectOne("once.boardQA.dao.BoardQADAO.selectQnAAnswer", boardNo);
	}
}
