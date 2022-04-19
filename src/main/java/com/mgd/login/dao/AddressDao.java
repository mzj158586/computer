package com.mgd.login.dao;

import com.mgd.login.domain.Address;

import java.util.List;

public interface AddressDao {

    List<Address> selectAddressByUid(int uid);

    int addAddr(Address address);
}
