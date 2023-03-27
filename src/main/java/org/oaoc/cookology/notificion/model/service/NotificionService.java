package org.oaoc.cookology.notificion.model.service;

import java.util.ArrayList;

import org.oaoc.cookology.common.SearchDate;
import org.oaoc.cookology.notificion.model.vo.Notificion;

public interface NotificionService {
	ArrayList<Notificion> selectNewTop5();
	ArrayList<Notificion> selectAll();
	Notificion selectnotificion(int notificionno);
	int insertnotificion(Notificion notificion);
	int updatenotificion(Notificion notificion);
	int deletenotificion(int notificionno);
	ArrayList<Notificion> selectSearchTitle(String keyword);
	ArrayList<Notificion> selectSearchWriter(String keyword);
	ArrayList<Notificion> selectSearchDate(SearchDate date);
	Notificion selectLast();
}
