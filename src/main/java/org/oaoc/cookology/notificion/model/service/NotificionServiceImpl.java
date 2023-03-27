package org.oaoc.cookology.notificion.model.service;

import java.util.ArrayList;

import org.oaoc.cookology.common.SearchDate;
import org.oaoc.cookology.notificion.model.dao.NotificionDao;
import org.oaoc.cookology.notificion.model.vo.Notificion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("notificionService")
public class NotificionServiceImpl implements NotificionService {

	@Autowired
	private NotificionDao notificionDao;
	
	@Override
	public ArrayList<Notificion> selectNewTop5() {
		return notificionDao.selectNewTop5();
	}

	@Override
	public ArrayList<Notificion> selectAll() {
		return notificionDao.selectAll();
	}

	@Override
	public Notificion selectnotificion(int notificionno) {
		return notificionDao.selectnotificion(notificionno);
	}

	@Override
	public int insertnotificion(Notificion notificion) {
		return notificionDao.insertnotificion(notificion);
	}

	@Override
	public int updatenotificion(Notificion notificion) {
		return notificionDao.updatenotificion(notificion);
	}

	@Override
	public int deletenotificion(int notificionno) {
		return notificionDao.deletenotificion(notificionno);
	}

	@Override
	public ArrayList<Notificion> selectSearchTitle(String keyword) {
		return notificionDao.selectSearchTitle(keyword);
	}

	@Override
	public ArrayList<Notificion> selectSearchWriter(String keyword) {
		return notificionDao.selectSearchWriter(keyword);
	}

	@Override
	public ArrayList<Notificion> selectSearchDate(SearchDate date) {
		return notificionDao.selectSearchDate(date);
	}

	@Override
	public Notificion selectLast() {
		return notificionDao.selectLast();
	}

}
