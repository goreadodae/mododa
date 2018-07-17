package kr.pe.mododa.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.pe.mododa.member.model.vo.Member;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO{

	@Override
	public Member selectOneMember(SqlSessionTemplate sqlSession, Member m) {//회원 한명의 정보를 가져오는 메소드
		return sqlSession.selectOne("member.selectOneMember", m);
	}

	public boolean checkId(SqlSessionTemplate sqlSession, String memberId) {
		String id = sqlSession.selectOne("member.checkId", memberId);
		if(id==null) {
			return false;
		} else {
			return true;
		}
	}

	public boolean checkPw(SqlSessionTemplate sqlSession, String memberPw) {
		String pw = sqlSession.selectOne("member.checkPw", memberPw);
		if(pw==null) {
			return false;
		} else {
			return true;
		}
	}

}
