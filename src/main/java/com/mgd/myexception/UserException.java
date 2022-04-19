package com.mgd.myexception;

/**
 * @Author : 梅广东
 * @Date : 2022/4/9 13:55
 * @Description :
 **/
public class UserException extends RuntimeException {

    public UserException() {
    }

    public UserException(String message) {
        super(message);
    }
}
