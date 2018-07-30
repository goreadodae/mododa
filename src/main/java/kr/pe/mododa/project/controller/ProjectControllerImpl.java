package kr.pe.mododa.project.controller;

import java.util.ArrayList;

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
	@RequestMapping(value="searchProTitleOrMemberName.do")
	public Object searchProTitleOrMemberName(@RequestParam String keyword, @RequestParam int proNo) {
		
		SearchHelper sh = new SearchHelper();
		sh.setKeyword(keyword);
		sh.setProNo(proNo);
		
		ArrayList<ProjectPostList> searchResult = projectService.searchProTitleOrMemberName(sh);
		ModelAndView view = new ModelAndView();
		view.addObject("searchResult", searchResult);
		view.setViewName("jsonView");
		return view;

		
	}
	
/*	int memberNo = projectService.searchMemberNo(memberId); // 회원 번호 검색
	ModelAndView view = new ModelAndView();
	view.addObject("memberNo", memberNo);
	view.setViewName("jsonView");
	return view;
	
	ArrayList<ProjectPostList> postList = projectService.searchPostList(proNo);
		// System.out.println(postList);
		ModelAndView view = new ModelAndView();
		view.addObject("postList", postList);
		view.setViewName("project/privatePost");
		return view;
	*/
	

	
	@RequestMapping(value="gotoMoreProject.do")
	public Object gotoMoreProject(HttpSession session) { // 이동
		// 프로젝트 목록 읽어오기
		ArrayList<Project> projectList = this.projectList(session);
		ModelAndView view = new ModelAndView();
		view.addObject("projectList", projectList);
		view.setViewName("project/moreProject");
		return view;
	}

	



	

}
