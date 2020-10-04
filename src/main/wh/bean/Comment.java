package main.wh.bean;

import org.springframework.stereotype.Component;

@Component
public class Comment {
    private Integer cid;
    private Integer forBlog;
    private String content;

    public Comment() {
    }

    public Comment(Integer cid, Integer forBlog, String content) {
        this.cid = cid;
        this.forBlog = forBlog;
        this.content = content;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Integer getForBlog() {
        return forBlog;
    }

    public void setForBlog(Integer forBlog) {
        this.forBlog = forBlog;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
