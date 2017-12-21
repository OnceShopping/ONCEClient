package once.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import once.notice.dao.NoticeDAO;
import once.notice.vo.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDAO dao;

	@Override
	public List<NoticeVO> selectNoticeList() {
		
		List<NoticeVO> noticeList = dao.selectNoticeList();
		return noticeList;
	}

	@Override
	public NoticeVO selectNoticeDetail(int noticeNo) {
		
		return dao.selectNoticeDetail(noticeNo);
	}
}
