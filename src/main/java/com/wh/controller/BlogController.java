package com.wh.controller;


import com.wh.bean.Blog;
import com.wh.bean.Comment;
import com.wh.bean.User;
import com.wh.service.BlogService;
import com.wh.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class BlogController {
    @Autowired
    BlogService blogService;
    @Autowired
    CommentService commentService;

    @RequestMapping("/toMain")
    public String toMain(Model model){
        List<String> allBlogTitles = blogService.getAllBlogTitles(1);
        model.addAttribute("blogTitles",allBlogTitles);
        return "guestlist";
    }



    @RequestMapping("/showMyBlogs")
   public String showBlogs(Model model, HttpSession session){
//        PageHelper.startPage(pn,5);
        List<String> allBlogTitles = blogService.getAllBlogTitles(1);

//        PageInfo pageInfo = new PageInfo(allBlogTitles);

        model.addAttribute("blogTitles",allBlogTitles);
        return "admin";
    }

    @ResponseBody
    @RequestMapping("/deleteBlog")
    public void deleteBlog(String title){
        blogService.deleteBlog(title);
        return;
    }

    @RequestMapping("/addBlog")
    public String addBlog(Blog blog, HttpSession session){
//        User user =  (User)session.getAttribute("user");
        blog.setBlogOwner(1);
        blogService.insertBlog(blog);
        return "forward:/showMyBlogs";
    }

    @RequestMapping("/toUpdate")
    public String toUpdate(String title, Model model){
        Blog blog = blogService.getBlog(title);
        model.addAttribute("blog",blog);
        return "updatePage";
    }

    @RequestMapping("/update")
    public String update(Blog blog,Model model){
        if (blog.getBlogTitle()==null || blog.getBlogTitle()==""){
            return "/toWrite";
        }
        blogService.updateBlog(blog);
        return "forward:/showMyBlogs";
    }

    @RequestMapping("/showBlogG")
    public String showBlogG(String title, Model model){
        Blog blog = blogService.getBlog(title);
        List<Comment> comments = commentService.getComments(blog.getBid());
        model.addAttribute("comments",comments);
        model.addAttribute("blog",blog);

        return "guestShowPage";

    }

    @RequestMapping("/showBlogA")
    public String showBlogA(String title, Model model){
        Blog blog = blogService.getBlog(title);
        List<Comment> comments = commentService.getComments(blog.getBid());
        model.addAttribute("comments",comments);
        model.addAttribute("blog",blog);

        return "adminShowPage";

    }


    @ResponseBody
    @RequestMapping("/queryBlog")
      public  String queryBlog(String title){
        Blog blog = blogService.getBlog(title);
        if (blog!=null) return "true";
        else return "false";
    }

    @RequestMapping("/deleteComment")
    public String deleteCom(@RequestParam("cid")Integer cid,
                            @RequestParam("title")String title){
        commentService.deleteComment(cid);
        return "forward:/showBlog";
    }

    @ResponseBody
    @RequestMapping("/addCom")
    public void addCom(Comment comment){
        commentService.addComment(comment);
        return;
    }


}
