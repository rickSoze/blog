package com.wh.controller;

import com.wh.bean.User;
import com.wh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class UserController {
    @Autowired
    UserService userService;

    @RequestMapping("/login")
    public String login(User user, Model model, HttpSession session){
            try{
                userService.checkLogin(user);
                return "forward:/showMyBlogs";
            }catch (Exception e){
                model.addAttribute("loginFailed","用户名或密码错误！");
                return "login";
            }
    }


    @RequestMapping("/logout")
    public String logout(HttpSession session){
        return "forward:/toMain";
    }

}
