package com.cheekee.member.dao;

import com.cheekee.member.domain.MemberVO;

/**
 * Created by song on 2017-01-03.
 */
public interface MemberDAO {

    MemberVO loginCheck(MemberVO memberVO);

}
