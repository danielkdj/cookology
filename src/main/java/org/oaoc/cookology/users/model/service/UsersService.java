package org.oaoc.cookology.users.model.service;

import org.oaoc.cookology.users.model.vo.Users;

public interface UsersService {

    int insertUsers(Users users);
    int selectDupCheckID(String user_email);


    Users selectUsers(String user_email);
    int updateUsers(Users users);
    int deleteUsers(Users users);


    Users selectFindUsersID(Users users);
    int updateUsersPWD(Users users);
    Users selectUsersPWD(Users users);


    Users selectUsersLogin(Users users);



















}
