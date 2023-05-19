package org.oaoc.cookology.users.model.service;

import org.oaoc.cookology.users.model.dao.UsersDao;
import org.oaoc.cookology.users.model.vo.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UsersServiceImpl implements UsersService{

    @Autowired
    UsersDao usersDao;


    @Override
    public int insertUsers(Users users) {
        return usersDao.insertUsers(users);
    }

    @Override
    public int selectDupCheckID(String user_email) {
        return usersDao.selectDupCheckID(user_email);
    }



    @Override
    public Users selectUsers(String user_email) {
        return usersDao.selectUsers(user_email);
    }

    @Override
    public int updateUsers(Users users) {
        return usersDao.updateUsers(users);
    }

    @Override
    public int deleteUsers(Users users) {
        return usersDao.deleteUsers(users);
    }

    @Override
    public Users selectFindUsersID(Users users) {
        return usersDao.selectFindUsersID(users);
    }

    @Override
    public int updateUsersPWD(Users users) {
        return usersDao.updateUsersPWD(users);
    }

    @Override
    public Users selectUsersPWD(Users users) {
        return usersDao.selectUsersPWD(users);
    }

    @Override
    public Users selectUsersLogin(Users users) {
        return usersDao.selectUsersLogin(users);
    }
}
