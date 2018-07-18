package kr.pe.mododa.member.model.service;

import kr.pe.mododa.member.model.vo.Member;

public interface MemberService {
	public Member loginSHA(Member vo, boolean autoLogin);
	public boolean checkId(String memberId);
	public boolean checkPwSHA(Member vo);
	public int insertMemberSHA(Member vo);
}
