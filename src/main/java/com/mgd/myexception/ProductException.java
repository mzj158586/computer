package com.mgd.myexception;

/**
 * @Author : 梅广东
 * @Date : 2022/4/16 10:59
 * @Description :
 **/
public class ProductException extends RuntimeException {

    public ProductException() {
    }

    public ProductException(String message) {
        super(message);
    }
}
