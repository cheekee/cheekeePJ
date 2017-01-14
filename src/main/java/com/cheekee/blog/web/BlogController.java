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

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * Created by songhangyu on 2016-11-07.
 */
@Controller
public class BlogController {

    @Autowired
    private BlogService blogService;

    @RequestMapping(value="/blogList.do")
    public String blogList(Model model, @RequestParam("division") String division){
        List<String> blogCategoryList = blogService.selectBlogCategoryList(division);
        // 카테고리 태그 리스트
        model.addAttribute("blogCategoryList", blogCategoryList);
        model.addAttribute("division", division);
        return "/blog/blogList";
    }

    // 블로그 리스트 ajax
    @RequestMapping(value = "/ajaxBlogList.do")
    @ResponseBody
    public List<BlogVO> ajaxBlogList(@RequestParam("pageNumber") String pageNumber, @RequestParam("pageEndNumber") String pageEndNumber,
                                     @RequestParam("division") String division,
                                     @RequestParam(value="searchCategory",required=false) String searchCategory){
        BlogVO blogVO = new BlogVO();
        int pageNumber1 = Integer.parseInt(pageNumber);
        int pageEndNumber1 = Integer.parseInt(pageEndNumber);
        if(searchCategory != "" || searchCategory != null){
            blogVO.setSearchCategory(searchCategory);
        }
        blogVO.setPageNumber(pageNumber1);
        blogVO.setPageEndNumber(pageEndNumber1);
        blogVO.setDivision(division);
        List<BlogVO> blogList = blogService.selectBlogList(blogVO);

        return blogList;
    }

    // 블로그 상세 조회
    @RequestMapping(value="/blogRetrieve.do")
    public String blogRetrieve(@RequestParam("searchBlogIdx") String searchBlogIdx, Model model){
        BlogVO blogResult = blogService.selectBlogRetrieve(searchBlogIdx);
        model.addAttribute("blogResult", blogResult);
        return "/blog/blogRetrieve";
    }

    // 블로그 상세 조회 - 수정해야함
    @RequestMapping(value="/blogModifyForm.do")
    public String blogModifyForm(HttpSession httpSession, @RequestParam("searchBlogIdx") String searchBlogIdx, Model model){
        // 로그인세션 없을 때 메인으로 팅겨내기
        Object loginMember = httpSession.getAttribute("loginMember");
        if(loginMember == null){
            return "/index";
        }
        BlogVO blogResult = blogService.selectBlogRetrieve(searchBlogIdx);
        model.addAttribute("blogResult", blogResult);

        return "/blog/blogModifyForm";
    }

    @RequestMapping(value = "/blogModify.do")
    public String blogModify(HttpSession httpSession, @ModelAttribute("blogVO") BlogVO blogVO, Model model) {
        // 로그인세션 없을 때 메인으로 팅겨내기
        Object loginMember = httpSession.getAttribute("loginMember");
        if(loginMember == null){
            return "/index";
        }
        // blog, idea 입력
        int resultCnt = blogService.updatePost(blogVO);

        BlogVO blogResult = blogService.selectBlogRetrieve(blogVO.getBlogIdx());
        model.addAttribute("blogResult", blogResult);
        return "/blog/blogRetrieve";
    }

    // 포스트 삭제
    @RequestMapping(value = "/blogDelete.do")
    public String blogDelete(HttpSession httpSession, @RequestParam("searchBlogIdx") String searchBlogIdx, Model model) {
        // 로그인세션 없을 때 메인으로 팅겨내기
        Object loginMember = httpSession.getAttribute("loginMember");
        if(loginMember == null){
            return "/index";
        }
        // blog, idea 입력
        int resultCnt = blogService.deletePost(searchBlogIdx);

        return "/blog/blogList";
    }

}