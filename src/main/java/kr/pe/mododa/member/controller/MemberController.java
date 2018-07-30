package kr.pe.mododa.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface MemberController {
	public String gotoMain(); // 0728 지은 수정
	public String login(HttpServletRequest request, @RequestParam String userId, @RequestParam String userPw,  @RequestParam String autoLogin, HttpServletResponse response);
	public ModelAndView checkEmail(HttpServletRequest request, @RequestParam String memberId);
	public String joinMember(HttpServletRequest request, @RequestParam String joinEmail, @RequestParam String joinPassword, @RequestParam String joinName);
	public String logoutMember(HttpServletRequest request, HttpServletResponse response);
	public ModelAndView checkLogin(HttpServletRequest request, @RequestParam String memberId, @RequestParam String memberPw);
}
