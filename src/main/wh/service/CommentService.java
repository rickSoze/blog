package main.wh.service;

import main.wh.bean.Comment;
import main.wh.dao.CommentDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentService {
    @Autowired
    CommentDao commentDao;

    public List<Comment> getComments(Integer bid){
        return commentDao.getCommentByBlogId(bid);
    }

    public void deleteComment(Integer cid){
        commentDao.deleteCommentByCid(cid);
    }

    public void addComment(Comment comment){
        commentDao.addCom(comment);
    }
}
