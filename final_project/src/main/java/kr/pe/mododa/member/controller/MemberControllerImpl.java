package kr.pe.mododa.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.pe.mododa.common.SHA256Util;
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
	
	@Autowired
	private SHA256Util sha256;

	@Override
	@RequestMapping(value="/login.do")
	public ModelAndView login(HttpServletRequest request, @RequestParam String memberId, @RequestParam String memberPw
			, @RequestParam boolean autoLogin) {
		Member vo = new Member();
		ModelAndView mav = new ModelAndView();//json으로 파싱할 객체
		vo.setMemberId(memberId);
		vo.setMemberPw(memberPw);
		try {
			System.out.println(sha256.encryData(vo.getMemberPw()));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(vo);
		if(!memberService.checkId(vo.getMemberId())) {
			mav.addObject("result", "failedId");
			mav.setViewName("jsonView");
			return mav;
		}
		if(!memberService.checkPwSHA(vo)) {
			mav.addObject("result", "failedPw");
			mav.setViewName("jsonView");
			return mav;
		}
		Member m = memberService.loginSHA(vo, autoLogin);
		HttpSession session = request.getSession();
		if(m!=null) {
			session.setAttribute("member", m);
		}
		mav.setViewName("jsonView");//이전뷰로 돌아갈셋팅
		return mav;
	}

	@Override
	@RequestMapping(value="/checkEmail.do")
	public ModelAndView checkEmail(HttpServletRequest request, String memberId) {
		boolean result = memberService.checkId(memberId);
		ModelAndView mav = new ModelAndView();//json으로 파싱할 객체
		mav.addObject("result", result);
		mav.setViewName("jsonView");
		return mav;
	}

	@Override
	@RequestMapping(value="/join.do")
	public String joinMember(HttpSession session, String joinEmail, String joinPassword, String joinName) {
		Member vo = new Member();
		vo.setMemberId(joinEmail);
		vo.setMemberPw(joinPassword);
		vo.setMemberName(joinName);
		int result = memberService.insertMemberSHA(vo);
		if(result>0) {
			return "redirect:/index.jsp";
		} else {
			return "member/error";
		}
	}
}
