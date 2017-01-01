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
    private String blogCount;
    private int pageNumber;
    private int pageEndNumber;
    private String searchCategory;

    public String getSearchCategory() {
        return searchCategory;
    }

    public void setSearchCategory(String searchCategory) {
        this.searchCategory = searchCategory;
    }

    public int getPageEndNumber() {
        return pageEndNumber;
    }

    public void setPageEndNumber(int pageEndNumber) {
        this.pageEndNumber = pageEndNumber;
    }

    public String getBlogCount() {
        return blogCount;
    }

    public void setBlogCount(String blogCount) {
        this.blogCount = blogCount;
    }

    public int getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(int pageNumber) {
        this.pageNumber = pageNumber;
    }

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
