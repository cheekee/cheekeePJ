package com.cheekee;

import com.cheekee.blog.domain.BlogVO;
import com.cheekee.blog.service.BlogService;
import com.cheekee.member.domain.MemberVO;
import com.cheekee.member.domain.WriteVO;
import com.cheekee.member.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.HttpSessionMutexListener;

import javax.servlet.http.HttpSession;

/**
 * Created by songhangyu on 2016-11-04.
 */
@Controller
public class HomeController {

    @Autowired
    private MemberService memberService;

    @Autowired
    private BlogService blogService;

    @RequestMapping(value = "/")
    public String home() {

        return "/index";
    }

    @RequestMapping(value = "/admin")
    public String loginForm() {

        return "/admin/loginForm";
    }

    @RequestMapping(value = "/login.do", method= RequestMethod.POST)
    public String login(@ModelAttribute("memberVO") MemberVO memberVO, HttpSession httpSession) {
        MemberVO loginMember = memberService.loginCheck(memberVO);
        /* table명 : MEMBER, 컬럼: MEMBER_ID, MEMBER_PW, MEMBER_LEVEL 만들어야함 */
        if(loginMember != null){
            httpSession.setAttribute("loginMember", loginMember);
        }

        return "/index";
    }

    @RequestMapping(value = "/logout.do")
    public String logout(HttpSession httpSession) {
        httpSession.invalidate();
        return "/index";
    }

    @RequestMapping(value = "/writeForm.do")
    public String writeFrom(HttpSession httpSession) {
        // 로그인세션 없을 때 메인으로 팅겨내기
        Object loginMember = httpSession.getAttribute("loginMember");
        if(loginMember == null){
            return "/index";
        }
        return "/admin/writeForm";
    }

    @RequestMapping(value = "/adminHome.do")
    public String adminHome(HttpSession httpSession) {
        // 로그인세션 없을 때 메인으로 팅겨내기
        Object loginMember = httpSession.getAttribute("loginMember");
        if(loginMember == null){
            return "/index";
        }
        return "/admin/adminHome";
    }

    @RequestMapping(value = "/write.do")
    public String write(HttpSession httpSession, @ModelAttribute("blogVO") BlogVO blogVO) {
        // 로그인세션 없을 때 메인으로 팅겨내기
        Object loginMember = httpSession.getAttribute("loginMember");
        if(loginMember == null){
            return "/index";
        }
        // blog, idea 입력
        int resultCnt = blogService.insertPost(blogVO);

        return "/index";
    }

    @RequestMapping(value = "/contact.do")
    public String contact() {

        return "/admin/contact";
    }

}