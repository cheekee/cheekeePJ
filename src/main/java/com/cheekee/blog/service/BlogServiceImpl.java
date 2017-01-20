package com.cheekee.blog.service;

import com.cheekee.blog.dao.BlogDAO;
import com.cheekee.blog.domain.BlogVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by songhangyu on 2016-11-08.
 */

@Service
public class BlogServiceImpl implements BlogService {

    @Autowired
    private BlogDAO blogDAO;

    @Override
    public List<BlogVO> selectBlogList(BlogVO blogVO){
        return blogDAO.selectBlogList(blogVO);
    }

    @Override
    public List<String> selectBlogCategoryList(String division){
        return blogDAO.selectBlogCategoryList(division);
    }

    @Override
    public BlogVO selectBlogRetrieve(String searchBlogIdx){
        return blogDAO.selectBlogRetrieve(searchBlogIdx);
    }
    @Override
    public int insertPost(BlogVO blogVO){
        return blogDAO.insertPost(blogVO);
    }

    @Override
    public int updatePost(BlogVO blogVO){
        return blogDAO.updatePost(blogVO);
    }

    @Override
    public int deletePost(String searchBlogIdx){
        return blogDAO.deletePost(searchBlogIdx);
    }

    @Override
    public List<BlogVO> selectPostTitle(){
        return blogDAO.selectPostTitle();
    }

}
