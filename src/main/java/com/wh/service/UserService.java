package com.wh.service;

import com.wh.bean.User;
import com.wh.mapper.UserDao;
import lombok.experimental.Tolerate;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    UserDao userDao;
    public void checkLogin(User user) throws Exception{
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(user.getUserName(), user.getUserPwd());
        subject.login(token);
    }


    public User getUserByName(String userName){
        return  userDao.getUser(userName);
    }
}
