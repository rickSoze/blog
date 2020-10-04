package main.wh.service;

import main.wh.bean.User;
import main.wh.dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    UserDao userDao;
    public User login(User user){
        if (userDao.isExist(user.getUserName())!=null){
           return userDao.getUser(user.getUserName());
        }
        return null;
    }

    public boolean registry(User user){
         Integer exist = userDao.isExist(user.getUserName());
         if (exist==null) {
             userDao.addUser(user);
             return true;
         }
         return false;
    }

    public User getUserByName(String userName){
        return  userDao.getUser(userName);
    }
}
