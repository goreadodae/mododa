package kr.pe.mododa.member.model.service;

import kr.pe.mododa.member.model.vo.AutoLogin;
import kr.pe.mododa.member.model.vo.Member;

public interface MemberService {
	public Member loginSHA(Member vo);
	public boolean checkId(String memberId);
	public boolean checkPwSHA(Member vo);
	public int insertMemberSHA(Member vo);
	public Member checkUserWithSessionKey(String sessionId);
	public int keepLogin(AutoLogin al);
	public int deleteAutoLogin(String id);
}
