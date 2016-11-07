package com.cheekee.blog.service;

import com.cheekee.blog.domain.BlogVO;

import java.util.List;

/**
 * Created by songhangyu on 2016-11-08.
 */

public interface BlogService {

    List<BlogVO> selectBlogList(BlogVO blogVO);

}
