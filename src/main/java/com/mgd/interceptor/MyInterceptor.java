package com.mgd.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @Author : 梅广东
 * @Date : 2022/4/9 19:33
 * @Description :
 **/
public class MyInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        Object uid = request.getSession().getAttribute("uid");
        if (uid!=null){
            return  true;
        }else {
            response.sendRedirect(request.getContextPath()+"/web/login.jsp");
        }
        return false;

    }
}
