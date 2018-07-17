package kr.pe.mododa.member.model.service;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.pe.mododa.member.model.dao.MemberDAOImpl;
import kr.pe.mododa.member.model.vo.Member;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	@Resource(name="memberDAO")
	private MemberDAOImpl memberDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public Member login(Member vo, boolean autoLogin) {
		if(autoLogin==true) {
			
		}
		Member m = memberDAO.selectOneMember(sqlSession, vo);
		
		return m;
	}

	public boolean checkId(String memberId) {
		boolean result = false;
		result = memberDAO.checkId(sqlSession, memberId);
		return result;
	}

	public boolean checkPw(String memberPw) {
		boolean result = false;
		result = memberDAO.checkPw(sqlSession, memberPw);
		return result;
	}

}
