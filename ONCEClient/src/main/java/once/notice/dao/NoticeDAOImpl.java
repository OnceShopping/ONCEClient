package once.notice.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import once.notice.vo.NoticeVO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<NoticeVO> selectNoticeList() {
		
		List<NoticeVO> noticeList = sqlSession.selectList("once.notice.dao.NoticeDAO.selectNoticeList");
		return noticeList;
	}

	@Override
	public NoticeVO selectNoticeDetail(int noticeNo) {
		
		return sqlSession.selectOne("once.notice.dao.NoticeDAO.selectNoticeDetail", noticeNo);
	}
}
