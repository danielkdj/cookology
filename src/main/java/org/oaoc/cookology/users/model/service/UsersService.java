package org.oaoc.cookology.users.model.service;

import java.util.ArrayList;

import org.oaoc.cookology.common.SearchDate;
import org.oaoc.cookology.common.Searchs;
import org.oaoc.cookology.users.model.vo.Users;

//스프링에서는 모델의 서비스 클래스는 인터페이스로 만들도록 정해져 있음
public interface UsersService {
	Users selectLogin(Users Users);
	int selectDupCheckId(String user_email);
	Users selectUsers(String user_email);
	ArrayList<Users> selectList();
	int insertUsers(Users Users);
	int updateUsers(Users Users);
	int updateLoginok(Users Users);
	int updateAdminok(Users Users);
	int deleteUsers(String user_email);	
	//검색을 위한 메소드
	ArrayList<Users> selectSearchUser_email(Searchs searchs);
	ArrayList<Users> selectSearchEnrollDate(SearchDate searchDate);
	ArrayList<Users> selectSearchLoginOK(Searchs searchs);
	ArrayList<Users> selectSearchAdminOK(Searchs searchs);
}










