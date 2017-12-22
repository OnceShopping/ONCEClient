package once.comment.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import once.comment.vo.CommentVO;

@Repository
public class CommentDAOImpl implements CommentDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public void selectById(String id) {
		sqlSession.selectOne("once.comment.dao.CommentDAO.selectById", id);
	}

	@Override
	public void insert(CommentVO comment) {
		sqlSession.insert("once.comment.dao.CommentDAO.insert", comment);
	}

	@Override
	public List<CommentVO> list(int num) {
		return sqlSession.selectList("once.comment.dao.CommentDAO.list", num);
	}

}
