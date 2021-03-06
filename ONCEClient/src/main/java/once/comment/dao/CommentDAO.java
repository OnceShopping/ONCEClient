package once.comment.dao;

import java.util.List;

import once.comment.vo.CommentVO;

public interface CommentDAO {

	void selectById(String id);

	void insert(CommentVO comment);

	List<CommentVO> list(int num);

	void addComment(CommentVO comment);
	
	List<CommentVO> selectByNum(int num);
	
	boolean checkComment(CommentVO comment);
}
