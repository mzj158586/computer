package com.mgd.login.controller;

import com.mgd.login.domain.User;
import com.mgd.login.service.UserService;
import com.mgd.myexception.UserException;
import com.mgd.vo.ResultVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * @Author : 梅广东
 * @Date : 2022/4/9 13:46
 * @Description :
 **/
@Controller
@RequestMapping(value = "/user")
public class UserController {

    @Resource
    private UserService userService;

    @ResponseBody
    @RequestMapping(value = "/register.do",method = RequestMethod.POST)
    public ResultVo doRegister(String username,String password)throws UserException {
        int num = userService.addUser(username,password);
        ResultVo resultVo;
        if (num>0){
              resultVo =ResultVo.success();
              resultVo.setMsg("注册成功");
        }else {
            resultVo = ResultVo.fail();
            resultVo.setMsg("注册失败");
        }
        return resultVo;

    }




    @ResponseBody
    @RequestMapping(value = "/login.do",method = RequestMethod.POST)
    public ResultVo doLogin(HttpServletRequest request, HttpServletResponse response,String username, String password,String auto){

        User user = userService.selectUserByNameAndPwd(username, password);
        ResultVo resultVo = ResultVo.success();
        resultVo.setResult(user);
        if (auto!=null) {
            Cookie cookie = new Cookie("username", username);
            cookie.setMaxAge(60 * 60 * 7);
            cookie.setPath(request.getContextPath());
            Cookie cookie1 = new Cookie("password", password);
            cookie1.setMaxAge(60 * 60 * 7);
            cookie1.setPath(request.getContextPath());
            response.addCookie(cookie);
            response.addCookie(cookie1);
            System.out.println(cookie);
            System.out.println(cookie1);
        }

        HttpSession session = request.getSession();
        session.setAttribute("uid",user.getUid());
        session.setAttribute("username",user.getUsername());
        return resultVo;
    }

    @RequestMapping("/autoLogin.do")
    @ResponseBody
    public  ResultVo doAutoLogin(HttpServletRequest request){
        Cookie[] cookies = request.getCookies();
        String username=null;
        String password=null;
        for (Cookie  cookie :cookies) {
            String key = cookie.getName();
            if ("username".equals(key)){
                username = cookie.getValue();
            }else if ("password".equals(key)){
                password = cookie.getValue();
            }
        }
        System.out.println(username);
        System.out.println(password);
        ResultVo resultVo=ResultVo.fail();
        if (username!=null&&password!=null){
            User user = userService.selectUserByNameAndPwd(username, password);
            if (user!=null){
                request.getSession().setAttribute("uid",user.getUid());
                request.getSession().setAttribute("username",user.getUsername());
                 resultVo = ResultVo.success();
            }
        }
        return resultVo;

    }

    @ResponseBody
    @RequestMapping(value = "/getUserById.do")
    public ResultVo getUserById(HttpSession session){
        System.out.println(432);
        Integer uid = getIdBySession(session);
        User user = userService.getUserById(uid);
        System.out.println(user);
        ResultVo success = ResultVo.success();
        success.setResult(user);
        return  success;

    }

    @ResponseBody
    @RequestMapping(value = "/changeInfo.do")
    public ResultVo doChangeInfo( User user, HttpSession session){
        Integer uid = getIdBySession(session);
        String username = getUserNameBySession(session);

        int num = userService.changeInfo(uid,username,user);
        ResultVo success = ResultVo.success();
        return  success;

    }
    private  final  static List<String> PHOTOTYPE  =new ArrayList<>();
    static {
        PHOTOTYPE.add("image/jpg");
        PHOTOTYPE.add("image/jpeg");
        PHOTOTYPE.add("image/png");
        PHOTOTYPE.add("image/bmp");
        PHOTOTYPE.add("image/gif");
    }


//    @RequestMapping(value = "/photoChange.do")
//    @ResponseBody
//    public String doPhotoChange( MultipartFile file, HttpSession session) throws IOException {
//        System.out.println(file);
//        String path = session.getServletContext().getRealPath("/image");
//        String originalFilename = file.getOriginalFilename();
//        String suffix = originalFilename.substring(originalFilename.lastIndexOf(".")+1,originalFilename.length());
//        fileName = UUID.randomUUID().toString().replace("-","")+"."+suffix;
//        File filePath = new File(path);
//        if (!filePath.exists()){
//            filePath.mkdir();
//        }
//        file.transferTo(new File(filePath+"/"+fileName));
//        if (!PHOTOTYPE.contains(file.getContentType())) {
//            throw new  UserException("图片格式不正确");
//        }
//        return  fileName;
//
//    }

    @ResponseBody
    @RequestMapping(value = "/updatePhoto.do")
    public ResultVo doChangeInfo(@RequestParam("file")MultipartFile file, HttpSession session) throws IOException {
        Integer uid = getIdBySession(session);
        System.out.println(file);
        String username = getUserNameBySession(session);
        String path = session.getServletContext().getRealPath("/image");
        String originalFilename = file.getOriginalFilename();
        String suffix = originalFilename.substring(originalFilename.lastIndexOf(".")+1,originalFilename.length());
        String fileName = UUID.randomUUID().toString().replace("-","")+"."+suffix;
        File filePath = new File(path);
        if (!filePath.exists()){
            filePath.mkdir();
        }
        file.transferTo(new File(filePath+"/"+fileName));
        if (!PHOTOTYPE.contains(file.getContentType())) {
            throw new  UserException("图片格式不正确");
        }
        int num = userService.updatePhoto(fileName,uid,username);
        ResultVo success = ResultVo.success();
        success.setResult(fileName);
        System.out.println(fileName);
        System.out.println(path);
        return  success;

    }





    private final Integer getIdBySession(HttpSession session){
        return  Integer.valueOf(session.getAttribute("uid").toString());
    }

    private final String  getUserNameBySession(HttpSession session){
        return  session.getAttribute("username").toString();
    }


}
