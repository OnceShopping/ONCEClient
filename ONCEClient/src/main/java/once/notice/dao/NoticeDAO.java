package once.notice.dao;

import java.util.List;

import once.notice.vo.NoticeVO;

public interface NoticeDAO {

	List<NoticeVO> selectNoticeList();

	NoticeVO selectNoticeDetail(int noticeNo);

}
