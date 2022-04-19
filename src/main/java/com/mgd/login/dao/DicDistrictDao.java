package com.mgd.login.dao;

import com.mgd.login.domain.DictDistrict;

import java.util.List;

public interface DicDistrictDao {

    List<DictDistrict> selectProvince(String parent);
    String selectNameByCode(String code);
}
