package com.wh.mapper;

import com.wh.bean.Comment;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;


@Repository
public interface CommentDao {
    //查看评论
    public ArrayList<Comment> getCommentByBlogId(Integer bid);
    //添加评论
    public void  addCom(Comment comment);
    //删除评论
    public void deleteCommentByCid(Integer cid);
}
