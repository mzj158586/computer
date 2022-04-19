package com.mgd.login.controller;

import com.mgd.login.domain.Address;
import com.mgd.login.domain.DictDistrict;
import com.mgd.login.service.AddressService;
import com.mgd.vo.ResultVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @Author : 梅广东
 * @Date : 2022/4/12 10:20
 * @Description :
 **/

@Controller
@RequestMapping(value = "/addr")
public class AddrController {

    @Resource
    private AddressService addressService;

    @ResponseBody
    @RequestMapping(value = {"/selectAddress.do","/showAddressList.do"})
    public ResultVo doSelectAddress(HttpSession session){
        Integer uid = getIdBySession(session);
        List<Address> addresses = addressService.selectAddress(uid);
        ResultVo success = ResultVo.success();
        success.setResult(addresses);
        return  success;
    }

    /**
     * description : 查询所有的省份
     * @date : 2022/4/13 11:14
      * @param parent:
      * @return: com.mgd.vo.ResultVo
     */
    @ResponseBody
    @RequestMapping("/selectProvince.do")
    public ResultVo doSelectProvince(String parent){

       List<DictDistrict> provinces = addressService.selectProvince(parent);
        ResultVo success = ResultVo.success();
        success.setResult(provinces);
        return success;
    }
    @ResponseBody
    @RequestMapping("/addAddr.do")
    public ResultVo doAddAddr(Address address,HttpSession session){
        Integer uid = getIdBySession(session);
        String username = getUserNameBySession(session);
        address.setUid(uid);
        address.setCreatedUser(username);
        int num = addressService.addAddr(address);
        ResultVo success = ResultVo.success();
        return success;
    }



    private final Integer getIdBySession(HttpSession session){
        return  Integer.valueOf(session.getAttribute("uid").toString());
    }

    private final String  getUserNameBySession(HttpSession session){
        return  session.getAttribute("username").toString();
    }


}
