package com.wh.bean;

import org.springframework.stereotype.Component;

@Component
public class Blog {
    private Integer bid;
    private Integer blogOwner;
    private String content;
    private String blogTitle;


    @Override
    public String toString() {
        return "Blog{" +
                "bid=" + bid +
                ", blogOwner=" + blogOwner +
                ", content='" + content + '\'' +
                ", blogTitle='" + blogTitle + '\'' +
                '}';
    }

    public Blog() {
    }


    public Blog(Integer blogOwner, String content, String blogTitle) {
        this.blogOwner = blogOwner;
        this.content = content;
        this.blogTitle = blogTitle;
    }

    public Blog(Integer bid, Integer blogOwner, String content, String blogTitle) {
        this.bid = bid;
        this.blogOwner = blogOwner;
        this.content = content;
        this.blogTitle = blogTitle;
    }

    public Integer getBid() {
        return bid;
    }

    public void setBid(Integer bid) {
        this.bid = bid;
    }

    public Integer getBlogOwner() {
        return blogOwner;
    }

    public void setBlogOwner(Integer blogOwner) {
        this.blogOwner = blogOwner;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getBlogTitle() {
        return blogTitle;
    }

    public void setBlogTitle(String blogTitle) {
        this.blogTitle = blogTitle;
    }
}
