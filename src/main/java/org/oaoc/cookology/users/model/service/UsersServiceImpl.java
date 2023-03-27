package org.oaoc.cookology.users.model.service;

import java.util.ArrayList;
import java.util.List;

import org.oaoc.cookology.common.SearchDate;
import org.oaoc.cookology.common.Searchs;
import org.oaoc.cookology.users.model.dao.UsersDao;
import org.oaoc.cookology.users.model.vo.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("usersService") 
public class UsersServiceImpl implements UsersService {

// Field
	@Autowired  
	UsersDao usersDao;

// Method
	@Override
	public Users selectLogin(Users users) {
		return usersDao.selectLogin(users);
	}

	@Override
	public int selectDupCheckId(String user_email) {
		return usersDao.selectDupCheckId(user_email);
	}

	@Override
	public Users selectUsers(String user_email) {
		return usersDao.selectUsers(user_email);
	}

	@Override
	public ArrayList<Users> selectList() {
		List<Users> list = usersDao.selectList();
		return (ArrayList<Users>)list;
	}

	@Override
	public int insertUsers(Users users) {
		return usersDao.insertUsers(users);
	}

	@Override
	public int updateUsers(Users users) {
		return usersDao.updateUsers(users);
	}

	@Override
	public int updateLoginok(Users users) {
		return usersDao.updateLoginok(users);
	}

	@Override
	public int updateAdminok(Users users) {
		return usersDao.updateAdminok(users);
	}

	@Override
	public int deleteUsers(String user_email) {
		return usersDao.deleteUsers(user_email);
	}

	@Override
	public ArrayList<Users> selectSearchUser_email(Searchs searchs) {
		List<Users> list = usersDao.selectSearchUser_email(searchs);
		return (ArrayList<Users>)list;
	}

	@Override
	public ArrayList<Users> selectSearchEnrollDate(SearchDate searchDate) {
		List<Users> list = usersDao.selectSearchEnrollDate(searchDate);
		return (ArrayList<Users>)list;
	}

	@Override
	public ArrayList<Users> selectSearchLoginOK(Searchs searchs) {
		List<Users> list = usersDao.selectSearchLoginOK(searchs);
		return (ArrayList<Users>)list;
	}

	@Override
	public ArrayList<Users> selectSearchAdminOK(Searchs searchs) {
		List<Users> list = usersDao.selectSearchAdminOK(searchs);
		return (ArrayList<Users>)list;
	}	
	

}
