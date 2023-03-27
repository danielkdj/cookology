package org.oaoc.cookology.notificion.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.oaoc.cookology.common.SearchDate;
import org.oaoc.cookology.notificion.model.vo.Notificion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("notificionDao")
public class NotificionDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	public ArrayList<Notificion> selectNewTop5() {
		List<Notificion> list = session.selectList("notificionMapper.selectNewTop5");
		return (ArrayList<Notificion>)list;
	}
	
	public ArrayList<Notificion> selectAll() {
		List<Notificion> list = session.selectList("notificionMapper.selectAll");
		return (ArrayList<Notificion>)list;
	}
	
	public Notificion selectnotificion(int notificionno) {
		return session.selectOne("notificionMapper.selectnotificion", notificionno);
	}
	
	public int insertnotificion(Notificion notificion) {
		return session.insert("notificionMapper.insertnotificion", notificion);
	}
	
	public int updatenotificion(Notificion notificion) {
		return session.update("notificionMapper.updatenotificion", notificion);
	}
	
	public int deletenotificion(int notificionno) {
		return session.delete("notificionMapper.deletenotificion", notificionno);
	}
	
	public ArrayList<Notificion> selectSearchTitle(String keyword) {
		List<Notificion> list = session.selectList("notificionMapper.selectSearchTitle", keyword);
		return (ArrayList<Notificion>)list;
	}
	
	public ArrayList<Notificion> selectSearchWriter(String keyword) {
		List<Notificion> list = session.selectList("notificionMapper.selectSearchWriter", keyword);
		return (ArrayList<Notificion>)list;
	}
	
	public ArrayList<Notificion> selectSearchDate(SearchDate date) {
		List<Notificion> list = session.selectList("notificionMapper.selectSearchDate", date);
		return (ArrayList<Notificion>)list;
	}
	
	public Notificion selectLast() {
		return session.selectOne("notificionMapper.selectLast");
	}
}
