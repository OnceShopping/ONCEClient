package once.notice.service;

import java.util.List;

import once.notice.vo.NoticeVO;

public interface NoticeService {

	List<NoticeVO> selectNoticeList();

	NoticeVO selectNoticeDetail(int noticeNo);

}
