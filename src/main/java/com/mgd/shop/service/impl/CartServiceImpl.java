package com.mgd.shop.service.impl;

import com.mgd.myexception.ProductException;
import com.mgd.sale.dao.ProductDao;
import com.mgd.sale.domain.Product;
import com.mgd.shop.dao.ShopCartDao;
import com.mgd.shop.domain.Cart;
import com.mgd.shop.service.CartService;
import com.mgd.vo.CartList;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

/**
 * @Author : 梅广东
 * @Date : 2022/4/17 14:02
 * @Description :
 **/
@Service
public class CartServiceImpl implements CartService {

    @Resource
    private ShopCartDao shopCartDao;

    @Resource
    private ProductDao productDao;


    /*
    * 加入购入车
    * */
    @Override
    public int inserCart(Integer pid, Integer price, Integer uid, String createUserName, Integer num) {
        Cart cart=shopCartDao.selectGoodsByPid(pid,uid);
        int i=0;
        if (cart==null){
            cart = new Cart();
            cart.setPid(pid);
            cart.setNum(num);
            cart.setUid(uid);
            cart.setPrice(price);
            cart.setCreatedUser(createUserName);
            cart.setCreatedTime(new Date());
             i = shopCartDao.insertGoods(cart);
            if (i<1){
                throw  new ProductException("商品添加失败");
            }

        }else {
            i=shopCartDao.updateGoods(pid,num);
            if (i<1){
                throw  new ProductException("商品添加失败");
            }
        }
        return i;
    }

    @Override
    public List<CartList> selectGoods(Integer uid) {

        List<CartList> cartLists = shopCartDao.selectGoods(uid);

        return cartLists;
    }

    @Override
    public int updateNum(Integer cid) {
        Cart cart = shopCartDao.selectGoodsByCid(cid);
        cart.setNum(cart.getNum()+1);
        int num = shopCartDao.updateGoodsByCid(cid,cart.getNum());
        num = cart.getNum();
        return num;
    }

    @Override
    public int updateReduceNum(Integer cid) {
        Cart cart = shopCartDao.selectGoodsByCid(cid);
        cart.setNum(cart.getNum()-1);
        int num = shopCartDao.updateGoodsByCid(cid,cart.getNum());
        num = cart.getNum();
        return num;
    }

    @Override
    public List<CartList> selectGoodsList(Integer[] cids, Integer uid) {

        List<CartList> cartLists = shopCartDao.selectGoodsList(cids);
        System.out.println(cartLists);
        Iterator<CartList> iterator = cartLists.iterator();
        while (iterator.hasNext()){
            CartList cartList = iterator.next();
            if (cartList.getUid()!=uid){
                iterator.remove();
            }
        }
        return cartLists;
    }
}
