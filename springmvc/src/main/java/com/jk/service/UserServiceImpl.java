package com.jk.service;

import com.alibaba.druid.sql.visitor.functions.If;
import com.jk.mapper.UserMapper;
import com.jk.model.login;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service("UserService")
public class UserServiceImpl implements  UserService{
    @Autowired
    UserMapper userMapper;

    @Override
    public void registered(login login) {
        //给实体生成UUID
        login.setLoginId(UUID.randomUUID().toString());
        userMapper.registered(login);
    }

    @Override
    public String loginUser(login login) {
        //1.前台传过来的值  传进mapper层 查询数据库 看是否有这个对象 必须是单一的对象
        login login1=userMapper.loginUser(login);
        //2.判断这个对象是否存在  存在进判断  不存在 返回 1   返回值是 1   前台提醒账号或密码错误即可   返回值2  表名账号密码正确 登录成功!
        if (login1!=null){
            //3.判断前台传过来的密码跟数据库查询出来的密码是否一致  一致返回 2  不一致返回1
                if(login1.getLoginPwd().equals(login.getLoginPwd().trim())){
                    return  "2";  //账号密码都正确
                }else{
                    return  "1";//密码不正确
                }
        }
        else{
            return "1";//用户不存在
        }
    }
}
