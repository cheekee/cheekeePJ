package com.cheekee.blog.web;

import com.cheekee.blog.domain.BlogVO;
import com.cheekee.blog.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by songhangyu on 2016-11-07.
 */
@Controller
public class BlogController {

    @Autowired
    private BlogService blogService;

    @RequestMapping(value="/blogList.do")
    public String blogList(Model model){
/*
        BlogVO blogVO = new BlogVO();
        List<BlogVO> blogList = blogService.selectBlogList(blogVO);
        model.addAttribute("blogList", blogList);*/
        return "/blog/blogList";
    }

    @RequestMapping(value = "/ajaxBlogList.do")
    @ResponseBody
    public List<BlogVO> ajaxBlogList(){
        List<BlogVO> blogList = blogService.selectBlogList(new BlogVO());
        return blogList;
    }

}
