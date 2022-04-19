package com.mgd.shop.dao;

import com.mgd.shop.domain.Cart;
import com.mgd.vo.CartList;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ShopCartDao {

    int insertGoods(Cart cart);

    Cart selectGoodsByPid(@Param("pid") Integer pid,@Param("uid") Integer uid);

    int updateGoods(@Param("pid") Integer pid,@Param("num") Integer num);

    List<CartList> selectGoods(Integer uid);

    Cart selectGoodsByCid(Integer cid);

    int updateGoodsByCid(@Param("cid") Integer cid,@Param("num") Integer num);

    List<CartList> selectGoodsList(Integer[] cids);

}
