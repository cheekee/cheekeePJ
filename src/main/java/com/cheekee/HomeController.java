package com.cheekee;

import com.cheekee.member.domain.MemberVO;
import com.cheekee.member.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.util.HttpSessionMutexListener;

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

    @RequestMapping(value = "/login.do")
    public String login(String memberId, String memberPw) {
        MemberVO memberVO = new MemberVO();
        memberVO.setMemberId(memberId);
        memberVO.setMemberPw(memberPw);
        MemberVO logingMember = memberService.loginCheck(memberVO);
        /* 여기서 세션에 loginMember 담아주면 되는데 HttpSession class가 없음... 뭐지............ */
        /* table명 : MEMBER, 컬럼: MEMBER_ID, MEMBER_PW, MEMBER_LEVEL 만들어야함 */

        return "/index";
    }

}