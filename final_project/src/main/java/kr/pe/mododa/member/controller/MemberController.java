package kr.pe.mododa.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface MemberController {
	public String gotoLogin();
	public ModelAndView login(HttpServletRequest request, @RequestParam String userId, @RequestParam String userPw,  @RequestParam boolean autoLogin);
}
