package com.cheekee;

import com.cheekee.member.domain.MemberVO;
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
    public String writeFrom() {

        return "/admin/writeForm";
    }

    @RequestMapping(value = "/adminHome.do")
    public String adminHome() {

        return "/admin/adminHome";
    }

    //
    //
    //
    // url에 /writeForm.do 치고 들어오면 들어가짐............ 세션정보 없으면 팅겨내야함

}