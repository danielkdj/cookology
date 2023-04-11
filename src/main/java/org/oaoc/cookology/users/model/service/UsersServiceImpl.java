package org.oaoc.cookology.users.model.service;

import org.oaoc.cookology.common.SearchDate;
import org.oaoc.cookology.common.Searchs;
import org.oaoc.cookology.orders.model.vo.Orders;
import org.oaoc.cookology.recipe.model.vo.Recipe;
import org.oaoc.cookology.users.model.dao.UsersDao;
import org.oaoc.cookology.users.model.vo.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service("usersService")
public class UsersServiceImpl implements UsersService {

	@Autowired
	UsersDao usersDao;

//======================================================================================================================

	//1. 회원가입
	@Override
	public int insertUsers(Users users) {
		return usersDao.insertUsers(users);
	}

	@Override
	public int selectDupCheckId(String user_email) {
		return usersDao.selectDupCheckId(user_email);
	}

//======================================================================================================================

	//2. 마이페이지
	@Override
	public Users selectUsers(String user_email) {
		return usersDao.selectUsers(user_email);
	}

	@Override
	public int updateUsers(Users users) {
		return usersDao.updateUsers(users);
	}

	@Override
	public ArrayList<Recipe> selectSearchMyRecipe(Users users) {
		return usersDao.selectSearchMyRecipe(users);
	}

	@Override
	public ArrayList<Orders> selectSearchMyOrder(String user_email) {
		return usersDao.selectSearchMyOrder(user_email);
	}

	@Override
	public int deleteUsers(String user_email) {
		return usersDao.deleteUsers(user_email);
	}

//======================================================================================================================

	//3. 아이디, 비밀번호 찾기
	@Override
	public String selectfindUsersId(Users users){
		return usersDao.selectfindUsersId(users);
	}

	@Override
	public Users selectfindUsersPassword(Users users) {
		return usersDao.selectfindUsersPassword(users);
	}

	@Override
	public int deleteUsersPassword(String user_password) {
		return usersDao.deleteUsersPassword(user_password);
	}

	@Override
	public int updateUsersPassword(String user_password) {
		return usersDao.updateUsersPassword(user_password);
	}

//======================================================================================================================

	//4. 로그인, 로그아웃
	@Override
	public Users selectUsersLogin(Users users) {
		return usersDao.selectUsersLogin(users);
	}

//======================================================================================================================

	//5. 관리자
	@Override
	public ArrayList<Users> selectList() {
		return usersDao.selectList();
	}

	@Override
	public int updateLoginOK(Users users) {
		return usersDao.updateLoginOK(users);
	}

	@Override
	public int updateAdminOK(Users users) {
		return usersDao.updateAdminOK(users);
	}

	@Override
	public ArrayList<Users> selectSearchUser_email(Searchs searchs) {
		return usersDao.selectSearchUser_email(searchs);
	}

	@Override
	public ArrayList<Users> selectSearchEnrollDate(SearchDate searchDate) {
		return usersDao.selectSearchEnrollDate(searchDate);
	}

	@Override
	public ArrayList<Users> selectSearchLoginOK(Searchs searchs) {
		return usersDao.selectSearchLoginOK(searchs);
	}

	@Override
	public ArrayList<Users> selectSearchAdminOK(Searchs searchs) {
		return usersDao.selectSearchAdminOK(searchs);
	}
}