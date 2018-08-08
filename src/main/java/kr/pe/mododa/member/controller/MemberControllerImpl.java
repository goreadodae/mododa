package kr.pe.mododa.member.controller;

import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import kr.pe.mododa.common.SHA256Util;
import kr.pe.mododa.member.model.service.MemberServiceImpl;
import kr.pe.mododa.member.model.vo.AutoLogin;
import kr.pe.mododa.member.model.vo.Member;
import kr.pe.mododa.member.model.vo.Partner;
import kr.pe.mododa.project.model.service.ProjectServiceImpl;
import kr.pe.mododa.project.model.vo.Project;

@Controller
public class MemberControllerImpl implements MemberController {
	@Autowired
	@Qualifier(value="memberService")
	private MemberServiceImpl memberService;
	
	@Autowired
	@Qualifier(value="projectService")
	private ProjectServiceImpl projectService;
	
	@Override
	@RequestMapping(value="/mainPage.do")
	public String gotoMain() {
		return "main/mainPage";
	}
	
	@RequestMapping(value="/mailCertify.do")
	public String mailCertify() {
		return "error/mailCertify";
	}
	
	@Autowired
	private SHA256Util sha256;

	@RequestMapping(value="/checkLogin.do")//로그인시 아이디가 틀렸는지 비밀번호가 틀렸는지 알려주는 메소드
	public ModelAndView checkLogin(HttpServletRequest request, @RequestParam String memberId, @RequestParam String memberPw) {
		Member vo = new Member();
		ModelAndView mav = new ModelAndView();//json으로 파싱할 객체
		vo.setMemberId(memberId);
		vo.setMemberPw(memberPw);
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
		mav.setViewName("jsonView");//이전뷰로 돌아갈셋팅
		return mav;
	}
	
	@Override
	@RequestMapping(value="/login.do")//로그인(쿠키값 설정, 세션설정)
	public String login(HttpServletRequest request, @RequestParam String memberId, @RequestParam String memberPw
			, @RequestParam String autoLogin, HttpServletResponse response) {
		Member vo = new Member();
		vo.setMemberId(memberId);
		vo.setMemberPw(memberPw);
		Member m = memberService.loginSHA(vo);
		HttpSession session = request.getSession();
		if(m!=null) {
			session.setAttribute("member", m);
			if(autoLogin.equals("true")) {
				Cookie cookie = new Cookie("loginCookie", session.getId());
				cookie.setPath("/");
				int amount = 60*60*24*7;
				cookie.setMaxAge(amount);
				response.addCookie(cookie);
				Date sessionLimit = new Date(System.currentTimeMillis() + (1000*amount));
				AutoLogin al = new AutoLogin();
				al.setAutoKey(session.getId());
				al.setMemberNo(m.getMemberNo());
				al.setAutoTime(sessionLimit);
				memberService.keepLogin(al);
			}
			return "redirect:/mainPage.do"; // 지은 수정
		} else {
			return "redirect:/index.jsp";
		}
	}
	
	@RequestMapping(value="/logout.do")
	public String logoutMember(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		if(session.getAttribute("member")!=null) {
			session.removeAttribute("member");
			session.invalidate();
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			if(loginCookie != null) {
				 loginCookie.setPath("/");
	                // 쿠키는 없앨 때 유효시간을 0으로 설정하는 것 !!! invalidate같은거 없음.
	                loginCookie.setMaxAge(0);
	                // 쿠키 설정을 적용한다.
	                response.addCookie(loginCookie);
	                // 사용자 테이블에서도 유효기간을 현재시간으로 다시 세팅해줘야함.
	                memberService.deleteAutoLogin(loginCookie.getValue());
			}
			return "redirect:/index.jsp";
		} else {
			return "redirect:/index.jsp";
		}
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
	public String joinMember(HttpServletRequest request, String memberId, String memberPw, String memberName) {
		Member vo = new Member();
		vo.setMemberId(memberId);
		vo.setMemberPw(memberPw);
		vo.setMemberName(memberName);
		int result = memberService.insertMemberSHA(vo);
		if(result>0) {
			vo.setMemberPw(memberPw);
			Member m = memberService.loginSHA(vo);
			HttpSession session = request.getSession();
			session.setAttribute("member", m);
			return "redirect:/index.jsp";
		} else {
			return "member/error";
		}
	}
	
	@RequestMapping(value="/confirmEmail.do")
	public ModelAndView confirmEmail(HttpSession session, HttpServletRequest request) throws Exception {
		String email = ((Member)session.getAttribute("member")).getMemberId();
		memberService.confirmEmail(email, request);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value = "/emailConfirm", method = RequestMethod.GET)
	public String emailConfirm(String key, Model model, HttpSession session) throws Exception { // 이메일인증
		boolean result = memberService.userAuth(key);
		if(result) {
			model.addAttribute("key", key);
			((Member)session.getAttribute("member")).setMemberEmailCertify("Y");
			return "main/comfirmEmailPage";
		} else {
			return "main/failedPage";
		}
	}
	
	@RequestMapping(value="/findPassword.do")
	public String findPassword(HttpSession session, @RequestParam String memberId, HttpServletRequest request) throws Exception {
		memberService.findPassword(memberId, request);
		return "redirect:/index.jsp";
	}
	
	@RequestMapping(value = "/passwordFind", method = RequestMethod.GET)
	public String passwordFind(String key, Model model, HttpSession session) throws Exception {
		boolean result = memberService.passwordFind(key);
		if(result) {
			return "main/passwordFindPage";
		} else {
			return "main/failedPage";
		}
		
	}
	
	@RequestMapping(value="/findChangPw.do")
	public String findChangPw(@RequestParam String key, @RequestParam String memberPw) {
		Member vo = new Member();
		vo.setMemberId(memberService.getMemberIdFromKey(key));
		vo.setMemberPw(memberPw);
		int result = memberService.changePwSHA(vo);
		if(result>0) {
			return "member/changeSuccess";
		} else {
			return "member/changeFailed";
		}
	}
	
	@RequestMapping(value="/myInfo.do", method = RequestMethod.GET)
	public ModelAndView myInfo(String menu, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		if(session.getAttribute("member")!=null) {
			int memberNo = ((Member)session.getAttribute("member")).getMemberNo();
			switch(menu) {
			case "myInfo": break;
			case "memberInfo":
				ArrayList<Project> projectList = projectService.searchProjectList(memberNo);
				mav.addObject("projectList", projectList);
				break;
			}
		}
		mav.setViewName("member/myInfo");
		return mav;
	}
	
	@RequestMapping(value="/changeMyInfo.do")
	public ModelAndView changeMyInfo(HttpSession session, @RequestParam String category, @RequestParam String context) throws Exception {
		Member vo = (Member) session.getAttribute("member");
		switch(category) {
		case "name":
			vo.setMemberName(context);
			break;
		case "depart":
			vo.setMemberDepartName(context);
			break;
		case "mainTask":
			vo.setMemberMainTask(context);
			break;
		}
		int result = memberService.changeMyInfo(vo);
		if(result>0) {
			session.setAttribute("member", vo);
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="/changePwPage.do")
	public String changePw() {
		return "member/changePwPage";
	}
	
	@RequestMapping(value="/changPw.do")
	public String changPw(@RequestParam String memberId, @RequestParam String memberPw) {
		Member vo = new Member();
		vo.setMemberId(memberId);
		vo.setMemberPw(memberPw);
		int result = memberService.changePwSHA(vo);
		if(result>0) {
			return "member/changeSuccess";
		} else {
			return "member/changeFailed";
		}
	}
	
	@RequestMapping(value="/changeMemberPic.do")
	public String changeMemberPic(MultipartHttpServletRequest request, HttpSession session) throws Exception {
		Member vo = (Member) session.getAttribute("member");
		memberService.changeMemberPic(request, vo);
		return "redirect:/myInfo.do?menu=myInfo";
	}
	
	@RequestMapping(value="/selectPartnerList.do")
	public ModelAndView selectPartnerList(@RequestParam int memberNo) {
		ModelAndView mav = new ModelAndView();
		ArrayList<Partner> list1 = memberService.selectPartnerList(memberNo);
		ArrayList<Partner> list2 = memberService.selectInvitingPartnerList(memberNo);
		mav.addObject("partnerList", list1);
		mav.addObject("invitingPartnerList", list2);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="/invitePartner.do")
	public ModelAndView invitePartner(@RequestParam int memberNo, @RequestParam String parId) {
		String result = memberService.invitePartner(memberNo, parId);
		ModelAndView mav = new ModelAndView();
		mav.addObject("result", result);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="/inviteCancel.do")
	public ModelAndView inviteCancel(@RequestParam int memberNo, @RequestParam int parNo) {
		int result = memberService.inviteCancel(memberNo, parNo);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="/acceptPartner.do")
	public ModelAndView acceptPartner(@RequestParam int memberNo, @RequestParam int parNo) {
		int result = memberService.acceptPartner(memberNo, parNo);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		return mav;
	}
	@RequestMapping(value="/searchPartner.do")
	public ModelAndView searchPartner(@RequestParam int memberNo, @RequestParam String searchPartnerText) {
		ArrayList<Partner> list = memberService.searchPartner(memberNo, searchPartnerText);
		ModelAndView mav = new ModelAndView();
		mav.addObject("searchPartnerList", list);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="/leaveMododa.do")
	public String leaveMododa(@RequestParam String memberId, HttpSession session) {
		int result = memberService.leaveMododa(memberId);
		if(result>0) {
			session.invalidate();
			return "redirect:/index.jsp";
		} else {
			return "member/changeFailed";
		}
	}
	
	@RequestMapping(value="/leaveMododaPage.do")
	public String leaveMododaPage() {
		return "member/leaveMododaPage";
	}
	
	@RequestMapping(value="/deletePartner.do")
	public ModelAndView deletePartner(@RequestParam int memberNo, @RequestParam int parNo) {
		int result = memberService.deletePartner(memberNo, parNo);
		if(result>0) {
			result = memberService.deletePartner(parNo, memberNo);
		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		return mav;
	}
}
