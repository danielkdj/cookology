package org.oneaonec.cookology.notice.model.service;

import java.util.ArrayList;

import org.oneaonec.cookology.common.SearchDate;
import org.oneaonec.cookology.notice.model.vo.Notice;

public interface NoticeService {
	ArrayList<Notice> selectNewTop5();
	ArrayList<Notice> selectAll();
	Notice selectNotice(int noticeno);
	int insertNotice(Notice notice);
	int updateNotice(Notice notice);
	int deleteNotice(int noticeno);
	ArrayList<Notice> selectSearchTitle(String keyword);
	ArrayList<Notice> selectSearchWriter(String keyword);
	ArrayList<Notice> selectSearchDate(SearchDate date);
	Notice selectLast();
}
