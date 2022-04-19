package com.mgd.login.service;

import com.mgd.login.domain.Address;
import com.mgd.login.domain.DictDistrict;

import java.util.List;

public interface AddressService {

    List<Address> selectAddress(int uid);

    List<DictDistrict> selectProvince(String parent);

    int addAddr(Address address);
}
