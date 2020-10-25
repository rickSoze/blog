package com.wh.mapper;

import com.wh.bean.Blog;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;

@Repository
public interface BlogDao {
    //根据用户id查询用户的所有blog
    public ArrayList<Blog> getBlogsByUserId(Integer userId);
    //根据用户id查询用户的所有blog的标题
    public ArrayList<String> getBlogTitlesByUserId(Integer userId);
    //根据博客标题查询一篇博客
    public Blog getBlogByTitle(String title);
    //查看一篇博客
    public Blog getBlogById(Integer bid);
    //添加一篇博客
    public void addBlog(Blog blog);
    //删除博客
    public void deleteBlogById(Integer bid);
    public void deleteBlogByTitle(String title);
    //修改博客
    public void updateBlog(Blog blog);
}
