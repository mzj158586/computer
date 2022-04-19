package com.mgd.vo;

/**
 * @Author : 梅广东
 * @Date : 2022/4/17 21:53
 * @Description :
 **/
public class CartList {

    private  Integer cid;
    private  Integer uid;
    private Integer pid;
    private String title;
    private String image;
    private  Integer num;
    private  Integer price;


    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }


    @Override
    public String toString() {
        return "CartList{" +
                "cid=" + cid +
                ", uid=" + uid +
                ", pid=" + pid +
                ", title='" + title + '\'' +
                ", image='" + image + '\'' +
                ", num=" + num +
                ", price=" + price +
                '}';
    }
}
