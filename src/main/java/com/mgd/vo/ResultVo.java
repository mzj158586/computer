package com.mgd.vo;

/**
 * @Author : 梅广东
 * @Date : 2022/4/9 13:43
 * @Description :
 **/
public class ResultVo<E> {

    private int state;
    private String msg;
    private Object result;

    public static ResultVo success(){
        ResultVo resultVo = new ResultVo();
        resultVo.setState(1);
        resultVo.setMsg("成功");
        return  resultVo;
    }
    public static ResultVo fail(){
        ResultVo resultVo = new ResultVo();
        resultVo.setState(0);
        resultVo.setMsg("失败");
        return  resultVo;
    }



    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getResult() {
        return result;
    }

    public void setResult(Object result) {
        this.result = result;
    }
}
