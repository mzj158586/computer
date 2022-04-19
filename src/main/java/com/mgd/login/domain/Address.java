package com.mgd.login.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;

/**
 * @Author : 梅广东
 * @Date : 2022/4/12 10:20
 * @Description :
 **/
public class Address implements Serializable {
    private Integer  aid;//地址id
    private Integer  uid;//用户id
    private String  name;//收货人的名字
    private String  provinceName;//收货人的省份
    private String  provinceCode;//省份编码
    private String  cityName;//收货人的城市
    private String  cityCode;//收货人的城市编码
    private String  areaName;//区域名字
    private String  areaCode;//区域编码
    private String  zip;//邮政编码
    private String  address;//收货地址
    private String  phone;//收货人手机号
    private String  tel;//收货人固话
    private String  tag;//标签
    private Integer  isDefault;//是否默认
    private String  createdUser;//创建人
    private Date createdTime;//创建时间
    private String  modifiedUser;//修改人
    private Date  modifiedTime;//修改时间

    public Address() {
    }

    public Integer getAid() {
        return aid;
    }

    public void setAid(Integer aid) {
        this.aid = aid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getProvinceName() {
        return provinceName;
    }

    public void setProvinceName(String provinceName) {
        this.provinceName = provinceName;
    }

    public String getProvinceCode() {
        return provinceCode;
    }

    public void setProvinceCode(String provinceCode) {
        this.provinceCode = provinceCode;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public String getCityCode() {
        return cityCode;
    }

    public void setCityCode(String cityCode) {
        this.cityCode = cityCode;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public String getAreaCode() {
        return areaCode;
    }

    public void setAreaCode(String areaCode) {
        this.areaCode = areaCode;
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public Integer getIsDefault() {
        return isDefault;
    }

    public void setIsDefault(Integer isDefault) {
        this.isDefault = isDefault;
    }

    public String getCreatedUser() {
        return createdUser;
    }

    public void setCreatedUser(String createdUser) {
        this.createdUser = createdUser;
    }

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    public String getModifiedUser() {
        return modifiedUser;
    }

    public void setModifiedUser(String modifiedUser) {
        this.modifiedUser = modifiedUser;
    }

    public Date getModifiedTime() {
        return modifiedTime;
    }

    public void setModifiedTime(Date modifiedTime) {
        this.modifiedTime = modifiedTime;
    }

    @Override
    public String toString() {
        return "Address{" +
                "aid=" + aid +
                ", uid=" + uid +
                ", name='" + name + '\'' +
                ", provinceName='" + provinceName + '\'' +
                ", provinceCode='" + provinceCode + '\'' +
                ", cityName='" + cityName + '\'' +
                ", cityCode='" + cityCode + '\'' +
                ", areaName='" + areaName + '\'' +
                ", areaCode='" + areaCode + '\'' +
                ", zip='" + zip + '\'' +
                ", address='" + address + '\'' +
                ", phone='" + phone + '\'' +
                ", tel='" + tel + '\'' +
                ", tag='" + tag + '\'' +
                ", isDefault=" + isDefault +
                ", createdUser='" + createdUser + '\'' +
                ", createdTime=" + createdTime +
                ", modifiedUser='" + modifiedUser + '\'' +
                ", modifiedTime=" + modifiedTime +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Address address1 = (Address) o;
        return Objects.equals(aid, address1.aid) &&
                Objects.equals(uid, address1.uid) &&
                Objects.equals(name, address1.name) &&
                Objects.equals(provinceName, address1.provinceName) &&
                Objects.equals(provinceCode, address1.provinceCode) &&
                Objects.equals(cityName, address1.cityName) &&
                Objects.equals(cityCode, address1.cityCode) &&
                Objects.equals(areaName, address1.areaName) &&
                Objects.equals(areaCode, address1.areaCode) &&
                Objects.equals(zip, address1.zip) &&
                Objects.equals(address, address1.address) &&
                Objects.equals(phone, address1.phone) &&
                Objects.equals(tel, address1.tel) &&
                Objects.equals(tag, address1.tag) &&
                Objects.equals(isDefault, address1.isDefault) &&
                Objects.equals(createdUser, address1.createdUser) &&
                Objects.equals(createdTime, address1.createdTime) &&
                Objects.equals(modifiedUser, address1.modifiedUser) &&
                Objects.equals(modifiedTime, address1.modifiedTime);
    }

    @Override
    public int hashCode() {
        return Objects.hash(aid, uid, name, provinceName, provinceCode, cityName, cityCode, areaName, areaCode, zip, address, phone, tel, tag, isDefault, createdUser, createdTime, modifiedUser, modifiedTime);
    }
}
