package com.mgd.shop.controller;

import com.mgd.shop.domain.Cart;
import com.mgd.shop.service.CartService;
import com.mgd.vo.CartList;
import com.mgd.vo.ResultVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @Author : 梅广东
 * @Date : 2022/4/17 13:54
 * @Description :
 **/
@Controller
@RequestMapping("/cart")
public class CartController {

    @Resource
    private CartService cartService;

 /*   @ResponseBody
    @RequestMapping("/insertGoods.do")
    public ResultVo doInsertGoods(Cart cart, HttpSession session){
        Integer uid = getIdBySession(session);
        String createUserName = getUserNameBySession(session);
        cart.setUid(uid);
        cart.setCreatedUser(createUserName);
        cart.setCreatedTime(new Date());
        int i = cartService.inserCart(cart);
        ResultVo success = ResultVo.success();
        return success;

    }*/

    @ResponseBody
    @RequestMapping("/insertGoods.do")
    public ResultVo doInsertGoods(Integer pid,Integer price,
                                  Integer num, HttpSession session){
        Integer uid = getIdBySession(session);
        String createUserName = getUserNameBySession(session);

        int i = cartService.inserCart(pid,price,uid,createUserName,num);
        ResultVo success = ResultVo.success();
        return success;

    }


    @ResponseBody
    @RequestMapping("/selectGoods.do")
    public ResultVo doSelectGoods(HttpSession session){
        Integer uid = getIdBySession(session);
        List<CartList> cartLists = cartService.selectGoods(uid);
        ResultVo success = ResultVo.success();
        success.setResult(cartLists);
        return success;

    }

    /*增加商品*/
    @ResponseBody
    @RequestMapping("/updateAddNum.do")
    public ResultVo doUpdateNum(Integer cid,HttpSession session){
        Integer uid = getIdBySession(session);
        int num = cartService.updateNum(cid);
        ResultVo success = ResultVo.success();
        success.setResult(num);
        return success;

    }

    @ResponseBody
    @RequestMapping("/updateReduceNum.do")
    public ResultVo doReduceNum(Integer cid){
        int num = cartService.updateReduceNum(cid);
        ResultVo success = ResultVo.success();
        success.setResult(num);
        return success;

    }

    private final Integer getIdBySession(HttpSession session){
        return  Integer.valueOf(session.getAttribute("uid").toString());
    }

    private final String  getUserNameBySession(HttpSession session){
        return  session.getAttribute("username").toString();
    }


}
