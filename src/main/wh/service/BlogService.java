package main.wh.service;

import main.wh.bean.Blog;
import main.wh.dao.BlogDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class BlogService {
    @Autowired
    BlogDao blogDao;

    public List<String> getAllBlogTitles(Integer id){
        return blogDao.getBlogTitlesByUserId(id);
    }

    public void deleteBlog(String title){
        blogDao.deleteBlogByTitle(title);
    }

    public void insertBlog(Blog blog){
        blogDao.addBlog(blog);
    }

    public Blog getBlog(String title){
        return blogDao.getBlogByTitle(title);
    }

    public void updateBlog(Blog blog){
        blogDao.updateBlog(blog);
    }



}
