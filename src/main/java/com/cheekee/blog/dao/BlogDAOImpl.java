package com.cheekee.blog.dao;

import com.cheekee.blog.domain.BlogVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by songhangyu on 2016-11-08.
 */
@Repository
public class BlogDAOImpl implements BlogDAO{

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<BlogVO> selectBlogList(BlogVO blogVO){
        return sqlSession.selectList("BlogMapper.selectBlogList", blogVO);
    }
    @Override
    public List<String> selectBlogCategoryList(String division){
        BlogVO blogVO = new BlogVO();
        blogVO.setDivision(division);
        return sqlSession.selectList("BlogMapper.selectBlogCategoryList", blogVO);
    }

    @Override
    public BlogVO selectBlogRetrieve(String searchBlogIdx){
        return sqlSession.selectOne("BlogMapper.selectBlogRetrieve", searchBlogIdx);
    }

    @Override
    public int insertPost(BlogVO blogVO){
        return sqlSession.insert("BlogMapper.insertPost", blogVO);
    }

    @Override
    public int updatePost(BlogVO blogVO){
        return sqlSession.update("BlogMapper.updatePost", blogVO);
    }

    @Override
    public int deletePost(String searchBlogIdx){
        return sqlSession.delete("BlogMapper.deletePost", searchBlogIdx);
    }

    @Override
    public List<BlogVO> selectPostTitle(){
        return sqlSession.selectList("BlogMapper.selectPostTitle");
    }

}
