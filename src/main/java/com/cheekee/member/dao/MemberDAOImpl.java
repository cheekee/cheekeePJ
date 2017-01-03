package com.cheekee.member.dao;

import com.cheekee.member.domain.MemberVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * Created by song on 2017-01-03.
 */
@Repository
public class MemberDAOImpl implements MemberDAO {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public MemberVO loginCheck(MemberVO memberVO){
        return sqlSession.selectOne("MemberMapper.loginCheck", memberVO);
    }


}
