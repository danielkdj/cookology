package org.oaoc.cookology.notice.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.oaoc.cookology.common.Paging;
import org.oaoc.cookology.common.SearchDate;
import org.oaoc.cookology.notice.model.vo.Notice;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("noticeDao")
public class NoticeDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	public ArrayList<Notice> selectNewTop5() {
		List<Notice> list = session.selectList("noticeMapper.selectNewTop5");
		return (ArrayList<Notice>)list;
	}
	
	public ArrayList<Notice> selectAll() {
		List<Notice> list = session.selectList("noticeMapper.selectAll");
		return (ArrayList<Notice>)list;
	}
	
	public Notice selectNotice(int noticeno) {
		return session.selectOne("noticeMapper.selectNotice", noticeno);
	}
	
	public int insertNotice(Notice notice) {
		return session.insert("noticeMapper.insertNotice", notice);
	}
	
	public int updateNotice(Notice notice) {
		return session.update("noticeMapper.updateNotice", notice);
	}
	
	public int deleteNotice(int noticeno) {
		return session.delete("noticeMapper.deleteNotice", noticeno);
	}
	
	public ArrayList<Notice> selectSearchTitle(Paging paging) {
		List<Notice> list = session.selectList("noticeMapper.selectSearchTitle", paging);
		return (ArrayList<Notice>)list;
	}
	
	public ArrayList<Notice> selectSearchWriter(String keyword) {
		List<Notice> list = session.selectList("noticeMapper.selectSearchWriter", keyword);
		return (ArrayList<Notice>)list;
	}
	
	public ArrayList<Notice> selectSearchDate(SearchDate date) {
		List<Notice> list = session.selectList("noticeMapper.selectSearchDate", date);
		return (ArrayList<Notice>)list;
	}
	
	public Notice selectLast() {
		return session.selectOne("noticeMapper.selectLast");
	}


	public ArrayList<Notice> selectPaging(Paging paging) {

		List<Notice> list = session.selectList("noticeMapper.selectPaging", paging);
		return (ArrayList<Notice>)list;
	}

	public int selectListCount() {
		return session.selectOne("noticeMapper.selectListCount");
	}

	public ArrayList<Notice> selectList(Paging paging) {
		List<Notice> list = session.selectList("noticeMapper.selectList", paging);
		return (ArrayList<Notice>)list;
	}

    public ArrayList<Notice> selectSearchList(String keyword) {
		List<Notice> list = session.selectList("noticeMapper.selectSearchList", keyword);
		return (ArrayList<Notice>)list;
    }

	public int selectSearchTitleCount(String keyword) {
		return session.selectOne("noticeMapper.selectSearchTitleCount", keyword);
	}

	public int selectSearchContentCount(String keyword) {
		return session.selectOne("noticeMapper.selectSearchContentCount", keyword);
	}

	public ArrayList<Notice> selectSearchContent(Paging paging) {
		List<Notice> list = session.selectList("noticeMapper.selectSearchContent", paging);
		return (ArrayList<Notice>)list;
	}
}
