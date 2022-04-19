package com.mgd.login.domain;

import java.io.Serializable;
import java.util.Objects;

/**
 * @Author : 梅广东
 * @Date : 2022/4/13 11:08
 * @Description :
 **/
public class DictDistrict implements Serializable {

    private int id;
    private String parent;
    private String code;
    private String name;

    public DictDistrict() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getParent() {
        return parent;
    }

    public void setParent(String parent) {
        this.parent = parent;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "DictDistrict{" +
                "id=" + id +
                ", parent='" + parent + '\'' +
                ", code='" + code + '\'' +
                ", name='" + name + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        DictDistrict that = (DictDistrict) o;
        return id == that.id &&
                Objects.equals(parent, that.parent) &&
                Objects.equals(code, that.code) &&
                Objects.equals(name, that.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, parent, code, name);
    }
}
