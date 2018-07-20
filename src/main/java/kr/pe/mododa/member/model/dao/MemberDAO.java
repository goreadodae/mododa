package kr.pe.mododa.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import kr.pe.mododa.member.model.vo.AutoLogin;
import kr.pe.mododa.member.model.vo.Member;

public interface MemberDAO {
	public Member selectOneMember(SqlSessionTemplate sqlSession, Member m);
	public boolean checkId(SqlSessionTemplate sqlSession, String memberId);
	public boolean checkPw(SqlSessionTemplate sqlSession, Member vo);
	public int insertMember(SqlSessionTemplate sqlSession, Member vo);
    // 자동로그인 체크한 경우에 사용자 테이블에 세션과 유효시간을 저장하기 위한 메서드
    public int keepLogin(SqlSessionTemplate sqlSession, AutoLogin al);
    // 이전에 로그인한 적이 있는지, 즉 유효시간이 넘지 않은 세션을 가지고 있는지 체크한다.
    public Member checkUserWithSessionKey(SqlSessionTemplate sqlSession, String sessionId);
    public int deleteAutoLogin(SqlSessionTemplate sqlSession, String id);
}
