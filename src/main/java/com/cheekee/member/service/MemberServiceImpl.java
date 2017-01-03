package com.cheekee.member.service;

import com.cheekee.member.dao.MemberDAO;
import com.cheekee.member.domain.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by song on 2017-01-03.
 */
@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private MemberDAO memberDAO;

    @Override
    public MemberVO loginCheck(MemberVO memberVO){
        return memberDAO.loginCheck(memberVO);
    }

}
