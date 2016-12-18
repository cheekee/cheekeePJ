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
    public List<String> selectBlogCategoryList(){
        return blogDAO.selectBlogCategoryList();
    }

}
