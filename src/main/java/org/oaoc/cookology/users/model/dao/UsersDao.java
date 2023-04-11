package org.oaoc.cookology.users.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.oaoc.cookology.common.SearchDate;
import org.oaoc.cookology.common.Searchs;
import org.oaoc.cookology.orders.model.vo.Orders;
import org.oaoc.cookology.recipe.model.vo.Recipe;
import org.oaoc.cookology.users.model.vo.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository("UsersDao")
public class UsersDao {

	@Autowired
	private SqlSessionTemplate session;

//======================================================================================================================

	public int insertUsers(Users users) { return session.insert("usersMapper.insertUsers", users);
	}

	public int selectDupCheckId(String users_email) {
		return session.selectOne("usersMapper.selectDupCheckId", users_email);
	}


//======================================================================================================================

	//2. 마이페이지
	public Users selectUsers(String user_email) {
		return session.selectOne("usersMapper.selectUsers", user_email);
	}

	public int updateUsers(Users users) {return session.update("usersMapper.updateUsers", users);
	}

	public ArrayList<Recipe> selectSearchMyRecipe(Users users) {
		List<Recipe> list = session.selectList("usersMapper.selectSearchMyRecipe", users);
		return (ArrayList<Recipe>)list;
	}

	public ArrayList<Orders> selectSearchMyOrder(String user_email) {
		List<Orders> list = session.selectList("usersMapper.selectSearchMyOrder", user_email);
		return (ArrayList<Orders>)list;
	}

	public int deleteUsers(String user_email) { return session.delete("usersMapper.deleteUsers", user_email);
	}

//======================================================================================================================

	//3. 아이디, 비밀번호 찾기
	public String selectfindUsersId(Users users){
		return session.selectOne("usersMapper.selectfindUsersId", users);
	}

	public Users selectfindUsersPassword(Users users) { return session.selectOne("usersMapper.selectfindUsersPassword", users);
	}

	public int deleteUsersPassword(String user_password) { return session.delete("usersMapper.deleteUsersPassword", user_password);
	}

	public int updateUsersPassword(String user_password) { return session.update("usersMapper.updateUsersPassword", user_password);
	}


//======================================================================================================================

	//4. 로그인, 로그아웃
	public Users selectUsersLogin(Users users) { return session.selectOne("usersMapper.selectUsersLogin", users);
	}

//======================================================================================================================

	//5. 관리자용
	public ArrayList<Users> selectList() {
		List<Users> list = session.selectList("usersMapper.selectSearchMyOrder");
		return (ArrayList<Users>)list;
	}


	public int updateLoginOK(Users users) { return session.update("usersMapper.updateLoginOK", users);
	}

	public int updateAdminOK(Users users) { return session.update("usersMapper.updateAdminOK", users);
	}

	public ArrayList<Users> selectSearchUser_email(Searchs searchs) {
		List<Users> list = session.selectList("usersMapper.selectSearchUser_email", searchs);
		return (ArrayList<Users>)list;
	}

	public ArrayList<Users> selectSearchEnrollDate(SearchDate searchDate) {
		List<Users> list = session.selectList("usersMapper.selectSearchEnrollDate", searchDate);
		return (ArrayList<Users>)list;
	}

	public ArrayList<Users> selectSearchLoginOK(Searchs searchs) {
		List<Users> list = session.selectList("usersMapper.selectSearchLoginOK", searchs);
		return (ArrayList<Users>)list;
	}

	public ArrayList<Users> selectSearchAdminOK(Searchs searchs) {
		List<Users> list = session.selectList("usersMapper.selectSearchAdminOK", searchs);
		return (ArrayList<Users>)list;
	}
}