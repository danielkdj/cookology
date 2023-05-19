package org.oaoc.cookology.notice.model.service;

import java.util.ArrayList;

import org.oaoc.cookology.common.Paging;
import org.oaoc.cookology.common.SearchDate;
import org.oaoc.cookology.notice.model.vo.Notice;

public interface NoticeService {
	ArrayList<Notice> selectNewTop5();
	ArrayList<Notice> selectAll();
	Notice selectNotice(int noticeno);
	int insertNotice(Notice notice);
	int updateNotice(Notice notice);
	int deleteNotice(int noticeno);

	Notice selectLast();
	ArrayList<Notice> selectPaging(Paging paging);
	ArrayList<Notice> selectSearchList(String keyword);
	int selectListCount();


	ArrayList<Notice> selectList(Paging paging);

	int selectSearchTitleCount(String keyword);

	ArrayList<Notice> selectSearchTitle(Paging paging);

	int selectSearchContentCount(String keyword);

	ArrayList<Notice> selectSearchContent(Paging paging);
}
