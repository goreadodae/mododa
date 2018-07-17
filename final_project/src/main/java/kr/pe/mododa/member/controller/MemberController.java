package kr.pe.mododa.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface MemberController {
	public String gotoLogin();
	public ModelAndView login(HttpServletRequest request, @RequestParam String userId, @RequestParam String userPw,  @RequestParam boolean autoLogin);
	public ModelAndView checkEmail(HttpServletRequest request, @RequestParam String memberId);
	public String joinMember(HttpSession session, @RequestParam String joinEmail, @RequestParam String joinPassword, @RequestParam String joinName);
}
