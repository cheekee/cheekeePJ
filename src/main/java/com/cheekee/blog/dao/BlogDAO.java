package com.cheekee.blog.dao;

import com.cheekee.blog.domain.BlogVO;

import java.util.List;

/**
 * Created by songhangyu on 2016-11-08.
 */
public interface BlogDAO {

    List<BlogVO> selectBlogList(BlogVO blogVO);
    List<String> selectBlogCategoryList();
    BlogVO selectBlogRetrieve(String searchBlogIdx);
    int insertBlog(BlogVO blogVO);
}
