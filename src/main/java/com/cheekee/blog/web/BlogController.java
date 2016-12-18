package com.cheekee.blog.web;

import com.cheekee.blog.domain.BlogVO;
import com.cheekee.blog.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

        List<String> blogCategoryList = blogService.selectBlogCategoryList();
        // 블로그 카테고리 태그 리스트
        model.addAttribute("blogCategoryList", blogCategoryList);
        return "/blog/blogList";
    }

    // 블로그 리스트 ajax
    @RequestMapping(value = "/ajaxBlogList.do")
    @ResponseBody
    public List<BlogVO> ajaxBlogList(@RequestParam("pageNumber") String pageNumber, @RequestParam("pageEndNumber") String pageEndNumber){
        BlogVO blogVO = new BlogVO();
        int pageNumber1 = Integer.parseInt(pageNumber);
        int pageEndNumber1 = Integer.parseInt(pageEndNumber);
        blogVO.setPageNumber(pageNumber1);
        blogVO.setPageEndNumber(pageEndNumber1);
        List<BlogVO> blogList = blogService.selectBlogList(blogVO);

        return blogList;
    }

    // 블로그 상세 조회 - 수정해야함
    @RequestMapping(value="/blogRetrieve.do")
    public String blogRetrieve(){

        return "/blog/blogRetrieve";
    }

}
