package com.cheekee.blog.domain;

/**
 * Created by songhangyu on 2016-11-08.
 */
public class BlogVO {

    private String blogIdx;
    private String blogCategory;
    private String blogTitle;
    private String blogDesc;
    private String blogDt;
    private String blogRegister;

    public String getBlogIdx() {
        return blogIdx;
    }

    public void setBlogIdx(String blogIdx) {
        this.blogIdx = blogIdx;
    }

    public String getBlogDesc() {
        return blogDesc;
    }

    public void setBlogDesc(String blogDesc) {
        this.blogDesc = blogDesc;
    }

    public String getBlogCategory() {
        return blogCategory;
    }

    public void setBlogCategory(String blogCategory) {
        this.blogCategory = blogCategory;
    }

    public String getBlogTitle() {
        return blogTitle;
    }

    public void setBlogTitle(String blogTitle) {
        this.blogTitle = blogTitle;
    }

    public String getBlogDt() {
        return blogDt;
    }

    public void setBlogDt(String blogDt) {
        this.blogDt = blogDt;
    }

    public String getBlogRegister() {
        return blogRegister;
    }

    public void setBlogRegister(String blogRegister) {
        this.blogRegister = blogRegister;
    }
}
