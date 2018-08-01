package kr.pe.mododa.project.controller;

import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.pe.mododa.member.model.vo.Member;
import kr.pe.mododa.project.model.service.ProjectServiceImpl;
import kr.pe.mododa.project.model.vo.Project;
import kr.pe.mododa.project.model.vo.ProjectPostList;
import kr.pe.mododa.project.model.vo.SearchHelper;
import kr.pe.mododa.project.model.vo.WorkOnMember;
import kr.pe.mododa.project.model.vo.WorkOnProject;



@Controller("projectController")
public class ProjectControllerImpl implements ProjectController {
	
	
	@Autowired
	@Qualifier(value="projectService")
	private ProjectServiceImpl projectService;
	

	// --------------------- 프로젝트 생성, 프로젝트 멤버 초대
	
	@Override
	@RequestMapping(value="gotoCreateProject.do") // 이동
	public String gotoCreateProject() {
		return "project/createProject";
	}
	
	
	@Override
	@RequestMapping(value="createProject.do")
	public String createProject(HttpSession session, Project project) { // 새 프로젝트 생성

		if(session.getAttribute("member")!=null) { // 세션으로 로그인 정보 가져오기
			
			project.setProMemberNo(((Member)session.getAttribute("member")).getMemberNo());
			
			int proResult = projectService.insertProject(project);
			if(proResult>0) { // 프로젝트 생성이 성공하면 insertWorkOn 진행하기
				
				int wonResult = projectService.insertWorkOn(project.getProMemberNo());
				if(wonResult>0) {
					System.out.println("프로젝트 생성 성공");
				} else {
					System.out.println("work_on 실패");
				}
				
			} else {
				System.out.println("project 실패");
			}
			
		} else {
			System.out.println("세션 정보 실패");
		}
		
		return "redirect:/gotoInviteMember.do";
		
	}
	
	
	@Override
	@RequestMapping(value="gotoInviteMember.do") // 이동
	public String gotoInviteMember(HttpSession session) {
		return "project/inviteMemberPage";
		
	}
	
	
	@Override
	@RequestMapping(value="inviteMember.do")
	public String inviteMember(@RequestParam String memberId) { // 프로젝트 생성 후 바로 멤버 초대

		// work_on에 insert하기
		// 1. 회원 번호 검색
		int memberNo = projectService.searchMemberNo(memberId); // 회원 번호 검색
		// 2. work_on에 insert하기
		int result = projectService.insertInviteMember(memberNo);	
		if(result>0) {
			return "redirect:/gotoInviteMember.do";
		} else {
			System.out.println("멤버초대실패");
			return null; // 실패했을 경우
		}
	}
	
	
	@Override
	@RequestMapping(value="checkInvite.do")
	public Object checkInvite(@RequestParam String memberId) { // 초대할 회원이 존재하는지 확인
		
		int memberNo = projectService.searchMemberNo(memberId); // 회원 번호 검색
		ModelAndView view = new ModelAndView();
		view.addObject("memberNo", memberNo);
		view.setViewName("jsonView");
		return view;
	}
	
	// ---------------------
	
	
	
	// --------------------- 프로젝트 목록 읽어오기 -> leftBar와 연결
	
	@Override
	public ArrayList<Project> projectList(HttpSession session) { // 로그인 한 사용자의 소속 프로젝트 리스트 읽어오기
		
		if(session.getAttribute("member")!=null) { // 로그인 세션을 가져오기
			
			int memberNo = ((Member)session.getAttribute("member")).getMemberNo();
			ArrayList<Project> projectList = projectService.searchProjectList(memberNo);
			return projectList;
			
		} else {
			System.out.println("세션 실패");
			return null;
		}

	}
	
	@Override
	public Project privateList(HttpSession session) { // 로그인 한 사용자의 프라이빗 프로젝트 읽어오기
		
		if(session.getAttribute("member")!=null) { // 로그인 세션을 가져오기
			
			int memberNo = ((Member)session.getAttribute("member")).getMemberNo();
			Project privateProject = projectService.searchPrivateList(memberNo);
			return privateProject;
			
		} else {
			System.out.println("세션 실패");
			return null;
		}
	}
	
	// ---------------------
	
	
	
	// --------------------- 글 읽어오기
	
	@Override
	@RequestMapping(value="projectPost.do")
	public Object projectPost(@RequestParam int proNo) { // 프로젝트 글 목록 읽어오기
		
		ArrayList<ProjectPostList> postList = projectService.searchPostList(proNo);
		// System.out.println(postList);
		ModelAndView view = new ModelAndView();
		view.addObject("postList", postList);
		view.setViewName("project/projectPost");
		return view;
		
	}

	@Override
	@RequestMapping(value="privatePost.do")
	public Object privatePost(@RequestParam int proNo) { // 프라이빗 글 목록 읽어오기
		
		ArrayList<ProjectPostList> postList = projectService.searchPostList(proNo);
		// System.out.println(postList);
		ModelAndView view = new ModelAndView();
		view.addObject("postList", postList);
		view.setViewName("project/privatePost");
		return view;
	}
	
	@Override
	@RequestMapping(value="projectMyPost.do")
	public Object projectMyPost(HttpSession session, @RequestParam int proNo) { // 내가 쓴 글 읽어오기

		if(session.getAttribute("member")!=null) {
			
			Project project = new Project();
			project.setProNo(proNo);
			project.setProMemberNo(((Member)session.getAttribute("member")).getMemberNo());
			
			ArrayList<ProjectPostList> postList = projectService.searchMyPostList(project);
			ModelAndView view = new ModelAndView();
			view.addObject("postList", postList);
			view.setViewName("project/projectMyPost");
			return view;
		} else {
			System.out.println("세션 실패");
			return null;
		}
	}
	
	@Override
	@RequestMapping(value="projectHashTag.do")
	public Object projectHashTag(@RequestParam int proNo) { // 해시태그 글 목록 읽어오기(프로젝트)
		
		ArrayList<ProjectPostList> postList = projectService.searchHashTagPostList(proNo);
		// System.out.println(postList);
		ModelAndView view = new ModelAndView();
		view.addObject("postList", postList);
		view.setViewName("project/projectHashTag");
		return view;
		
	}
	
	@Override
	@RequestMapping(value="privateHashTag.do")
	public Object privateHashTag(@RequestParam int proNo) { // 해시태그 글 목록 읽어오기(프라이빗)
		
		ArrayList<ProjectPostList> postList = projectService.searchHashTagPostList(proNo);
		// System.out.println(postList);
		ModelAndView view = new ModelAndView();
		view.addObject("postList", postList);
		view.setViewName("project/privateHashTag");
		return view;
		
	}


	// ---------------------
	
	
	
	// --------------------- 검색
	
	@Override
	@RequestMapping(value="searchProTitleOrMemberName.do") // 프로젝트 또는 프라이빗 글
	public Object searchProTitleOrMemberName(@RequestParam String keyword, @RequestParam int proNo, @RequestParam String projectValue) {
		
		SearchHelper sh = new SearchHelper();
		sh.setKeyword(keyword);
		sh.setProNo(proNo);
		sh.setProjectValue(projectValue);
		// memberNo = 0
		ArrayList<ProjectPostList> searchResult = projectService.searchProTitleOrMemberName(sh);
		ModelAndView view = new ModelAndView();
		view.addObject("searchResult", searchResult);
		view.setViewName("jsonView");
		return view;
	
	}
	
	
	@Override
	@RequestMapping(value="searchMyPostProTitle.do") // 내가 쓴 글
	public Object searchMyPostProTitle(HttpSession session, @RequestParam String keyword, @RequestParam int proNo) {
		
		if(session.getAttribute("member")!=null) {
			SearchHelper sh = new SearchHelper();
			sh.setKeyword(keyword);
			sh.setProNo(proNo);
			sh.setMemberNo(((Member)session.getAttribute("member")).getMemberNo());
			// memberNo != 0
			ArrayList<ProjectPostList> searchResult = projectService.searchProTitleOrMemberName(sh);
			ModelAndView view = new ModelAndView();
			view.addObject("searchResult", searchResult);
			view.setViewName("jsonView");
			return view;
		} else {
			System.out.println("세션 실패");
			return null;
		}
	
	}
	
	
	@Override
	@RequestMapping(value="searchHashTag.do") // 해시태그 검색
	public Object searchHashTag(@RequestParam String keyword, @RequestParam int proNo) {
		
		
		SearchHelper sh = new SearchHelper();
		sh.setProNo(proNo);
		
		StringTokenizer st = new StringTokenizer(keyword.replaceAll(" ", ""), ","); // 해시태그 공백없애고 쪼개서 저장
		int cnt = st.countTokens();
		String[] tagArr = new String[cnt];
		for(int i=0; i<cnt; i++) {
			tagArr[i] = st.nextToken();	
		}
		sh.setHashTags(tagArr);

		// memberNo = 0
		ArrayList<ProjectPostList> searchResult = projectService.searchHashTag(sh);
		ModelAndView view = new ModelAndView();
		view.addObject("searchResult", searchResult);
		view.setViewName("jsonView");
		return view;
		
	}
	
	// ---------------------
	
	
	// --------------------- 프로젝트 진행 현황
	
	@Override
	@RequestMapping(value="projectProgress.do")
	public Object projectProgress(@RequestParam int proNo) {
		
		// 프로젝트 글 목록 읽어오기
		ArrayList<ProjectPostList> postList = projectService.searchPostList(proNo);
		// System.out.println(postList);
		ModelAndView view = new ModelAndView();
		view.addObject("postList", postList);
		view.setViewName("project/projectProgress");
		return view;
	}
	
	
	
	
	

	
	@RequestMapping(value="gotoMoreProject.do")
	public Object gotoMoreProject(HttpSession session) { // 이동
		// 프로젝트 목록 읽어오기
		ArrayList<Project> projectList = this.projectList(session);
		ModelAndView view = new ModelAndView();
		view.addObject("projectList", projectList);
		view.setViewName("project/moreProject");
		return view;
	}
	

	/*멤버 초대 관련 함수(기존 멤버초대와 다른 쿼리여야하기 때문에)*/
	@RequestMapping(value="inviteMemberAtHeader.do")
	public ModelAndView inviteMemberAtHeader(@RequestParam int proNo, @RequestParam String inviteMemberId) {
		ModelAndView view = new ModelAndView();
		String result = projectService.inviteMemberAtHeader(proNo, inviteMemberId);
		view.addObject("result",result);
		view.setViewName("jsonView");
		return view;
	}
	
	@RequestMapping(value="selectWorkOnMemberList.do")
	public ModelAndView selectMemberList(@RequestParam int proNo, @RequestParam int memberNo) {
		ModelAndView view = new ModelAndView();
		ArrayList<WorkOnMember> womList = projectService.selectMemberList(proNo);
		ArrayList<WorkOnProject> invitingMemberList = projectService.selectInvitingMemberList(memberNo);
		view.addObject("memberList", womList);
		view.addObject("memberInvitingProList", invitingMemberList);
		view.setViewName("jsonView");
		return view;
	}
	
	@RequestMapping(value="/inviteProMemberCancel.do")
	public ModelAndView inviteProMemberCancel(@RequestParam int memberNo, @RequestParam int proNo) {
		int result = projectService.inviteProMemberCancel(memberNo, proNo);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="/invitingWorkOnMemberList.do")
	public ModelAndView invitingWorkOnMemberList(@RequestParam int memberNo) {
		ModelAndView view = new ModelAndView();
		ArrayList<WorkOnProject> invitingMemberList = projectService.selectInvitingMemberList(memberNo);
		view.addObject("memberInvitingProList", invitingMemberList);
		view.setViewName("jsonView");
		return view;
	}
}
