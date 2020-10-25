package com.wh.mapper;


import com.wh.bean.User;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDao {
    //用户是否存在
    public Integer isExist(String userName);
    //根据用户名查密码
    public String getPwd(String userName);
    //新增一个用户
    public void addUser(User user);
    //根据用户名查询用户
    public User getUser(String userName);
}
