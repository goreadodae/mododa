package kr.pe.mododa.member.model.service;

import kr.pe.mododa.member.model.vo.Member;

public interface MemberService {
	public Member login(Member vo, boolean autoLogin);
	public boolean checkId(String memberId);
	public boolean checkPw(String memberPw);
}
