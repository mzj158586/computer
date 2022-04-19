package com.mgd.myexception;

/**
 * @Author : 梅广东
 * @Date : 2022/4/12 10:59
 * @Description :
 **/
public class AddressException extends RuntimeException {
    public AddressException() {
    }

    public AddressException(String message) {
        super(message);
    }
}
