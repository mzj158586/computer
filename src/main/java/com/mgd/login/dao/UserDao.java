package com.mgd.login.dao;

import com.mgd.login.domain.User;
import org.apache.ibatis.annotations.Param;

public interface UserDao {

    int addUser(User user);
    User selectUserByNameAndPwd(@Param("username") String username, @Param("password") String password);

    User selectUserByName(String username);

    User selectUserById(Integer uid);

    int updateUser(User result);

    int updatePhoto(User user);

}
