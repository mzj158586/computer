package com.mgd.shop.service;

import com.mgd.shop.domain.Cart;
import com.mgd.vo.CartList;

import java.util.List;

/**
 * @Author : 梅广东
 * @Date : 2022/4/17 13:56
 * @Description :
 **/
public interface CartService {


    int inserCart(Integer pid, Integer price, Integer uid, String createUserName, Integer num);

    List<CartList> selectGoods(Integer uid);

    int updateNum(Integer cid);

    int updateReduceNum(Integer cid);

    List<CartList> selectGoodsList(Integer[] cids, Integer uid);
}
