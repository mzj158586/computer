package com.mgd.login.service;


import com.mgd.login.domain.User;

public interface UserService {


    int addUser(String username,String password);

    User  selectUserByNameAndPwd(String username,String password);

    int changeInfo(Integer uid,String username, User user);

    User getUserById(Integer uid);

    int updatePhoto(String fileName, Integer uid, String username);
}
