package once.boardQA.dao;

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
}
