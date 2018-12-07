package com.jk.controller;

import com.jk.model.login;
import com.jk.service.UserService;
import com.jk.utils.CheckImgUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("user")
public class UserController {
    @Autowired
    UserService userService;

    //生成验证码
    @RequestMapping("checkCode")
    public void checkCode(HttpServletRequest request, HttpServletResponse response){
        try {
            CheckImgUtil.checkImg(request, response);
        } catch (Exception e) {

            e.printStackTrace();
        }
    }

    @RequestMapping("registered")
    @ResponseBody
    public String registered(String code, login login,HttpServletRequest request){
        //1.从session中取出自动生成的验证码
        String scode = (String) request.getSession().getAttribute("checkcode");
        //2.判断验证码是否跟你从前台传的验证码正确   正确,进判断  不正确,返回1
        if(scode.toLowerCase().equals(code.toLowerCase())){
            //3.将用户填的信息传到service层 进行业务处理
            userService.registered(login);
            return "";
        }else{
            return "3";//验证码错误!
        }
    }

    /**
     * 这是用户登录方法
     * @param login
     * @param code2
     * @param request
     * @return  需要前台进行判断
     */
    @RequestMapping("loginUser")
    @ResponseBody
    public String  loginUser(login login,String code2,HttpServletRequest request){
        //1.从session中取出自动生成的验证码
        String checkcode = (String) request.getSession().getAttribute("checkcode");
        //2.定义一个变量 以便存储返回的值 用作前台进行判断
        String success="";
        //3.判断验证码是否跟你从前台传的验证码正确   正确,进判断  不正确,返回3 验证码错误
        if(checkcode.toLowerCase().equals(code2.toLowerCase())){
            //4.将参数传入service层  接受的参数 为 1  表名 账号或密码错误    参数为2 表名账号密码正确 登录成功!!
            success =userService.loginUser(login);
            return  success;
        }else{
            success ="3";
            return success;//验证码错误
        }
    }
}
