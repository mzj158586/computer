package com.mgd.login.service.impl;

import com.mgd.login.dao.AddressDao;
import com.mgd.login.dao.DicDistrictDao;
import com.mgd.login.domain.Address;
import com.mgd.login.domain.DictDistrict;
import com.mgd.login.service.AddressService;
import com.mgd.myexception.AddressException;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * @Author : 梅广东
 * @Date : 2022/4/12 10:56
 * @Description :
 **/
@Service
public class AddressServiceImpl implements AddressService {

    @Resource
    private AddressDao addressDao;

    @Resource
    private DicDistrictDao dicDistrictDao;

    @Override
    public List<Address> selectAddress(int uid) {
        List<Address> addresses = addressDao.selectAddressByUid(uid);
        if (addresses==null){
            throw new AddressException("没有地址");
        }
        return addresses;
    }


    @Override
    public List<DictDistrict> selectProvince(String parent) {
        List<DictDistrict> provinces = dicDistrictDao.selectProvince(parent);
        if (provinces==null){
            throw  new AddressException("省份查找失败");
        }
        return provinces;
    }

    @Override
    public int addAddr(Address address) {
        String provinceName = dicDistrictDao.selectNameByCode(address.getProvinceCode());
        String cityName = dicDistrictDao.selectNameByCode(address.getCityCode());
        String areaName = dicDistrictDao.selectNameByCode(address.getAreaCode());
        address.setProvinceName(provinceName);
        address.setCityName(cityName);
        address.setAreaName(areaName);
        address.setIsDefault(0);
        address.setCreatedTime(new Date());
        int num = addressDao.addAddr(address);
        if (num<0){
            throw  new AddressException("添加失败");
        }

        return num;
    }
}
