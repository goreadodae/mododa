package kr.pe.mododa.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import kr.pe.mododa.member.model.vo.Member;

public interface MemberDAO {
	public Member selectOneMember(SqlSessionTemplate sqlSession, Member m);
	public boolean checkId(SqlSessionTemplate sqlSession, String memberId);
	public boolean checkPw(SqlSessionTemplate sqlSession, Member vo);
	public int insertMember(SqlSessionTemplate sqlSession, Member vo);
}
