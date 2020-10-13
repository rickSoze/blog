package main.wh.controller;

//import com.github.pagehelper.PageHelper;
//import com.github.pagehelper.PageInfo;
import main.wh.bean.Blog;
import main.wh.bean.Comment;
import main.wh.bean.User;
import main.wh.service.BlogService;
import main.wh.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.nio.channels.SeekableByteChannel;
import java.util.List;

@Controller
public class BlogController {
    @Autowired
    BlogService blogService;

    @Autowired
    CommentService commentService;

    @RequestMapping("/toMain")
    public String toMain(Model model){
        List<String> allBlogTitles = blogService.getAllBlogTitles(2);
        model.addAttribute("blogs",allBlogTitles);
        return "GuestPage";
    }



    @RequestMapping("/showMyBlogs")
   public String showBlogs(Model model,HttpSession session){
        User user = (User) session.getAttribute("user");

//        PageHelper.startPage(pn,5);
        List<String> allBlogTitles = blogService.getAllBlogTitles(user.getUserId());

//        PageInfo pageInfo = new PageInfo(allBlogTitles);

        model.addAttribute("blogTitles",allBlogTitles);
        return "showPassages";
    }

    @ResponseBody
    @RequestMapping("/deleteBlog")
    public void deleteBlog(String title){
        blogService.deleteBlog(title);
        return;
    }

    @RequestMapping("/addBlog")
    public String addBlog(Blog blog, HttpSession session){
        User user =  (User)session.getAttribute("user");
        blog.setBlogOwner(user.getUserId());
        blogService.insertBlog(blog);
        return "forward:/showMyBlogs";
    }

    @RequestMapping("/toUpdate")
    public String toUpdate(String title,Model model){
        Blog blog = blogService.getBlog(title);
        model.addAttribute("blog",blog);
        return "update";
    }

    @RequestMapping("/update")
    public String update(Blog blog){
        blogService.updateBlog(blog);
        return "forward:/showMyBlogs";
    }

    @RequestMapping("/showBlog")
    public String showBlog(String title,Model model,HttpSession session){
        Blog blog = blogService.getBlog(title);
        List<Comment> comments = commentService.getComments(blog.getBid());
        model.addAttribute("comments",comments);
        model.addAttribute("blog",blog);
        if (session.getAttribute("user")!=null)
                return "showPage";
        return "GuestShowPage";

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
