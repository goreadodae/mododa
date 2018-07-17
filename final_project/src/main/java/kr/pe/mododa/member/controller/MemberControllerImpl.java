package kr.pe.mododa.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.pe.mododa.member.model.service.MemberServiceImpl;
import kr.pe.mododa.member.model.vo.Member;

@Controller
public class MemberControllerImpl implements MemberController {
	@Autowired
	@Qualifier(value="memberService")
	private MemberServiceImpl memberService;
	
	@Override
	@RequestMapping(value="/gotoLogin.do")
	public String gotoLogin() {
		return "member/loginPage";
	}

	@Override
	@RequestMapping(value="/login.do")
	public ModelAndView login(HttpServletRequest request, @RequestParam String memberId, @RequestParam String memberPw
			, @RequestParam boolean autoLogin) {
		Member vo = new Member();
		ModelAndView mav = new ModelAndView();//json으로 파싱할 객체
		vo.setMemberId(memberId);
		vo.setMemberPw(memberPw);
		if(!memberService.checkId(vo.getMemberId())) {
			mav.addObject("result", "failedId");
			mav.setViewName("jsonView");
			return mav;
		}
		if(!memberService.checkPw(vo.getMemberPw())) {
			mav.addObject("result", "failedPw");
			mav.setViewName("jsonView");
			return mav;
		}
		Member m = memberService.login(vo, autoLogin);
		HttpSession session = request.getSession();
		if(m!=null) {
			session.setAttribute("member", m);
		}
		mav.setViewName("jsonView");//이전뷰로 돌아갈셋팅
		return mav;
	}
}
