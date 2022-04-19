package com.mgd.order.controller;

import com.mgd.login.domain.Address;
import com.mgd.login.service.AddressService;
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
 * @Date : 2022/4/18 15:53
 * @Description :
 **/
@Controller
@RequestMapping("/order")
public class OrderController {

    @Resource
    private CartService cartService;

    @ResponseBody
    @RequestMapping("/selectGoodsList.do")
    public ResultVo doShowAddressList(Integer[] cids,HttpSession session){
        Integer uid = getIdBySession(session);
        List<CartList> cartLists = cartService.selectGoodsList(cids,uid);
        ResultVo success = ResultVo.success();
        success.setResult(cartLists);
        return  success;
    }

    private final Integer getIdBySession(HttpSession session){
        return  Integer.valueOf(session.getAttribute("uid").toString());
    }

    private final String  getUserNameBySession(HttpSession session){
        return  session.getAttribute("username").toString();
    }

}
