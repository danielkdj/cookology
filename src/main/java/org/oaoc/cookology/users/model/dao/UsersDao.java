package org.oaoc.cookology.users.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.oaoc.cookology.users.model.vo.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("UsersDao")
public class UsersDao {

    @Autowired
    private SqlSessionTemplate session;


    public int insertUsers(Users users) { return session.insert("usersMapper.insertUsers", users);
    }

    public int selectDupCheckID(String user_email) {
        return session.selectOne("usersMapper.selectDupCheckID", user_email);
    }

    public Users selectUsers(String user_email) { return session.selectOne("usersMapper.selectUsers", user_email);
    }

    public int updateUsers(Users users) {return session.update("usersMapper.updateUsers", users);
    }

    public int deleteUsers(Users users) {return session.delete("usersMapper.deleteUsers", users);
    }

    public Users selectFindUsersID(Users users) {return session.selectOne("usersMapper.selectFindUsersID", users);
    }

    public int updateUsersPWD(Users users) {return session.update("usersMapper.updateUsersPWD", users);
    }

    public Users selectUsersPWD(Users users) {return session.selectOne("usersMapper.selectUsersPWD", users);
    }

    public Users selectUsersLogin(Users users) {
        return session.selectOne("usersMapper.selectUsersLogin", users);
    }

}
