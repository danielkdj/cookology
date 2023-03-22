package org.oneaonec.cookology.notice.model.service;

import java.util.ArrayList;

import org.oneaonec.cookology.common.SearchDate;
import org.oneaonec.cookology.notice.model.dao.NoticeDao;
import org.oneaonec.cookology.notice.model.vo.Notice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDao noticeDao;
	
	@Override
	public ArrayList<Notice> selectNewTop5() {
		return noticeDao.selectNewTop5();
	}

	@Override
	public ArrayList<Notice> selectAll() {
		return noticeDao.selectAll();
	}

	@Override
	public Notice selectNotice(int noticeno) {
		return noticeDao.selectNotice(noticeno);
	}

	@Override
	public int insertNotice(Notice notice) {
		return noticeDao.insertNotice(notice);
	}

	@Override
	public int updateNotice(Notice notice) {
		return noticeDao.updateNotice(notice);
	}

	@Override
	public int deleteNotice(int noticeno) {
		return noticeDao.deleteNotice(noticeno);
	}

	@Override
	public ArrayList<Notice> selectSearchTitle(String keyword) {
		return noticeDao.selectSearchTitle(keyword);
	}

	@Override
	public ArrayList<Notice> selectSearchWriter(String keyword) {
		return noticeDao.selectSearchWriter(keyword);
	}

	@Override
	public ArrayList<Notice> selectSearchDate(SearchDate date) {
		return noticeDao.selectSearchDate(date);
	}

	@Override
	public Notice selectLast() {
		return noticeDao.selectLast();
	}

}
