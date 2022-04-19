package com.mgd.login.service.impl;

import com.mgd.login.dao.UserDao;
import com.mgd.login.domain.User;
import com.mgd.login.service.UserService;
import com.mgd.myexception.UserException;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import javax.annotation.Resource;
import java.util.Date;
import java.util.UUID;

/**
 * @Author : 梅广东
 * @Date : 2022/4/9 13:54
 * @Description :
 **/
@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserDao userDao;
        /**
         * description : 注册
         * @date : 2022/4/9 18:07
          * @param username:用户名
            *  @param password : 密码
          * @return: int
         */
    @Override
    public int addUser(String username,String password) {

        User user = userDao.selectUserByName(username);
        if (user!=null){
            throw  new UserException("用户名已经存在");
        }
        String salt = UUID.randomUUID().toString().toUpperCase();
        String md5Password = getMd5Password(password, salt);
        user = new User();
        user.setSalt(salt);
        Date date = new Date();
        user.setUsername(username);
        user.setIsDelete(0);
        user.setPassword(md5Password);
        user.setCreatedTime(date);
        user.setCreatedUser(username);
        int num = userDao.addUser(user);
        return num;
    }

    /*
    * 登录业务
    * */
    @Override
    public User selectUserByNameAndPwd(String username, String password) {

        User user = userDao.selectUserByName(username);
        if (user==null){
            throw  new UserException("用户名不存在");
        }
        String salt = user.getSalt();
        String md5Password = getMd5Password(password, salt);
        if (user.getIsDelete()==1){
            throw  new UserException("该用户被删除");
        }
        if (!md5Password.equals(user.getPassword())){
            throw  new UserException("密码被修改");
        }
        return user;
    }

    /**
     * description : 修改用户信息
     * @date : 2022/4/10 11:02
      * @param uid:
     * @param username :
     * @param user :
      * @return: int
     */
    @Override
    public int changeInfo(Integer uid, String username, User user) {
        User result = userDao.selectUserById(uid);
        result.setModifiedTime(new Date());
        result.setModifiedUser(username);
        result.setEmail(user.getEmail());
        result.setPhone(user.getPhone());
        result.setGender(user.getGender());
        int num = userDao.updateUser(result);
        if (num<0){
            throw new UserException("修改失败");
        }
        return num;
    }

    @Override
    public User getUserById(Integer uid) {
        User user = userDao.selectUserById(uid);
        return user;
    }

    @Override
    public int updatePhoto(String fileName, Integer uid, String username) {
        User user = userDao.selectUserById(uid);
        user.setAvatar(fileName);
        user.setModifiedUser(username);
        user.setModifiedTime(new Date());
        int num = userDao.updatePhoto(user);
        if (num <= 0){
            throw  new UserException("上传失败");
        }
        return num;
    }

    private String getMd5Password(String password, String salt) {
        /** 加密规则： * 1、无视原始密码的强度 * 2、使用UUID作为盐值，在原始密码的左右两侧拼接 * 3、循环加密3次 */
        for (int i = 0; i < 3; i++) {
            password = DigestUtils.md5DigestAsHex((salt + password + salt).getBytes()).toUpperCase();
        }
        return password;
    }
}
