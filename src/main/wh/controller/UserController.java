package main.wh.controller;

import main.wh.bean.User;
import main.wh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class UserController {
    @Autowired
    UserService userService;




    @RequestMapping("/login")
    public String login(User user, Model model,HttpSession session){
         User logined = userService.login(user);

         if (logined==null) {
             model.addAttribute("loginFailed","用户名或密码错误！");
             return "login";
         }


        User realUser = userService.getUserByName(user.getUserName());
        session.setAttribute("user",realUser);
        return "forward:/showMyBlogs";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.removeAttribute("user");
        return "forward:/toMain";
    }

//
//    @RequestMapping(value = "/registry",method = RequestMethod.POST)
//    public String registry(User user,Model model){
//         boolean passed= userService.registry(user);
//        if (passed){
//            model.addAttribute("regSuccess","注册成功！");
//            return "login";
//        }
//
//        model.addAttribute("regFailed","用户已存在！");
//        return "registry";
//    }
}
