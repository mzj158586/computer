package com.mgd.handler;

import com.mgd.vo.ResultVo;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @Author : 梅广东
 * @Date : 2022/4/9 14:10
 * @Description :
 **/
@ControllerAdvice
public class myHandler   {

    @ResponseBody
    @ExceptionHandler
    public ResultVo doUserException( Exception e) throws ServletException, IOException {
        ResultVo resultVo = new ResultVo();
        resultVo.setState(0);
        resultVo.setMsg(e.getMessage());
        return  resultVo;
    }

}
