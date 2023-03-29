package org.oaoc.cookology.users.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.oaoc.cookology.common.SearchDate;
import org.oaoc.cookology.common.Searchs;
import org.oaoc.cookology.users.model.vo.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("UsersDao")  //xml 에 자동 등록됨
public class UsersDao {
	//마이바티스 매퍼 파일에 쿼리문 별도로 작성함
	//root-context.xml 에 생성된 마이바티스 매퍼 연결 객체를 사용함
	@Autowired  //root-context.xml 에서 생성한 객체와 자동 연결
	private SqlSessionTemplate session;  //의존성 주입됨(DI)
		
	public Users selectLogin(Users users) {
		return session.selectOne("UsersMapper.selectLogin", users);
	}

	
	public ArrayList<Users> selectList() {
		List<Users> list = session.selectList("UsersMapper.selectList");
		return (ArrayList<Users>)list;
	}

	
	public int insertUsers(Users users) {
		return session.insert("UsersMapper.insertUsers", users);
	}

	
	public int updateUsers(Users users) {
		return session.update("UsersMapper.updateUsers", users);
	}

	
	public int deleteUsers(String user_email) {
		return session.delete("UsersMapper.deleteUsers", user_email);
	}


	public int selectDupCheckId(String user_email) {
		return session.selectOne("UsersMapper.selectDupCheckId", user_email);
	}


	public Users selectUsers(String user_email) {
		return session.selectOne("UsersMapper.selectUsers", user_email);
	}


	public int updateLoginok(Users users) {
		return session.update("UsersMapper.updateLoginok", users);
	}
	
	public int updateAdminok(Users users) {
		return session.update("UsersMapper.updateAdminok", users);
	}


	//검색 처리용 --------------------------------------
	public ArrayList<Users> selectSearchUser_email(Searchs searchs) {
		List<Users> list = session.selectList("UsersMapper.selectSearchUserid", searchs);
		return (ArrayList<Users>)list;
	}


	public ArrayList<Users> selectSearchLoginOK(Searchs searchs) {
		List<Users> list = session.selectList("UsersMapper.selectSearchLoginOK", searchs);
		return (ArrayList<Users>)list;
	}


	public ArrayList<Users> selectSearchEnrollDate(SearchDate searchDate) {
		List<Users> list = session.selectList("UsersMapper.selectSearchEnrollDate", searchDate);
		return (ArrayList<Users>)list;
	}

	public List<Users> selectSearchAdminOK(Searchs searchs) {
		List<Users> list = session.selectList("UsersMapper.selectSearchAdminOK", searchs);
		return (ArrayList<Users>)list;
	}
}
