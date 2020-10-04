package main.wh.dao;

import main.wh.bean.Comment;

import java.util.ArrayList;

public interface CommentDao {
    //查看评论
    public ArrayList<Comment> getCommentByBlogId(Integer bid);
    //添加评论
    public void  addCom(Comment comment);
    //删除评论
    public void deleteCommentByCid(Integer cid);
}
