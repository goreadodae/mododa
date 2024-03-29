package kr.pe.mododa.project.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;

import kr.pe.mododa.member.model.vo.Member;
import kr.pe.mododa.project.model.service.ProjectServiceImpl;
import kr.pe.mododa.project.model.vo.ProgressHelper;
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
		System.out.println(memberNo);
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
	
	
	
	@Override
	public ArrayList<Project> projectWorkingList(HttpSession session) { // 로그인 한 사용자의 소속 프로젝트 리스트 읽어오기
		
		if(session.getAttribute("member")!=null) { // 로그인 세션을 가져오기
			
			int memberNo = ((Member)session.getAttribute("member")).getMemberNo();
			ArrayList<Project> allProjectList = projectService.searchProjectList(memberNo);
			ArrayList<Project> projectList = new ArrayList<Project> ();
			
			for(int i=0; i<allProjectList.size(); i++) {
				if(allProjectList.get(i).getProProgress().equals("working")) {
					projectList.add(allProjectList.get(i));
				}
			}
			return projectList;
			
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
	@RequestMapping(value="projectProgress.do") // 일반 접속
	public Object projectProgress(@RequestParam int proNo) {
		
		// 프로젝트 글 목록 읽어오기
		ArrayList<ProjectPostList> postList = projectService.searchPostList(proNo);
		// System.out.println(postList);
		ModelAndView view = new ModelAndView();
		view.addObject("postList", postList);
		view.setViewName("project/projectProgress");
		return view;
	}
	
	
	@RequestMapping(value="projectProgress_mobile.do") // 모바일 접속
	public Object projectProgressMobile(@RequestParam int proNo) {
		// 프로젝트 글 목록 읽어오기
		ArrayList<ProjectPostList> postList = projectService.searchPostList(proNo);
		// System.out.println(postList);
		ModelAndView view = new ModelAndView();
		view.addObject("postList", postList);
		view.setViewName("project/projectProgress_mobile");
		return view;
	}
	
	@Override
	@RequestMapping(value="updatePostProgress.do")
	public Object updatePostProgress(@RequestParam String postNoStr, @RequestParam String postProgress, @RequestParam int proNo) {
		
		// 1. 업데이트 실행하기
		
		// 문자열 쪼개서 저장하기
		ProgressHelper ph = new ProgressHelper();
		StringTokenizer st = new StringTokenizer(postNoStr, ",");
		int cnt = st.countTokens();
		String[] postNoArr = new String[cnt];
		for(int i=0; i<cnt; i++) {
			postNoArr[i] = st.nextToken();	
		}
		ph.setPostNo(postNoArr);
		ph.setPostProgress(postProgress);
		
		int result = projectService.updatePostProgress(ph);
		
		if(result>0) { // 2. 성공 시 다시 프로젝트 글 목록 읽어오기
			
			ArrayList<ProjectPostList> postList = projectService.searchPostList(proNo);
			ModelAndView view = new ModelAndView();
			view.addObject("postList", postList);
			view.setViewName("jsonView");
			return view;
			
		} else {
			System.out.println("progress 변경 실패");
			return null;
		}

	}
	// ---------------------
	
	
	
	// --------------------- 프로젝트 더보기
	
	@Override
	@RequestMapping(value="gotoMoreProject.do") // 일반 접속
	public Object gotoMoreProject(HttpSession session) { // 이동
		
		if(session.getAttribute("member")!=null) { // 로그인 세션을 가져오기
			
			// 프로젝트 목록 읽어오기
			ArrayList<Project> projectList = this.projectList(session);
			// 리더 권한인 프로젝트 읽어오기
			int memberNo = ((Member)session.getAttribute("member")).getMemberNo();
			ArrayList<String> leaderProNo = projectService.searchLeaderProNo(memberNo);
			
			ModelAndView view = new ModelAndView();
			view.addObject("projectList", projectList);
			view.addObject("leaderProNo", leaderProNo);
			view.setViewName("project/moreProject");
			return view;
			
		} else {
			System.out.println("세션 실패");
			return null;
		}
		
	}
	
	
	@RequestMapping(value="gotoMoreProject_mobile.do")
	public Object gotoMoreProjectMobile(HttpSession session) { // 이동
		
		if(session.getAttribute("member")!=null) { // 로그인 세션을 가져오기
			
			// 프로젝트 목록 읽어오기
			ArrayList<Project> projectList = this.projectList(session);
			// 리더 권한인 프로젝트 읽어오기
			int memberNo = ((Member)session.getAttribute("member")).getMemberNo();
			ArrayList<String> leaderProNo = projectService.searchLeaderProNo(memberNo);
			
			ModelAndView view = new ModelAndView();
			view.addObject("projectList", projectList);
			view.addObject("leaderProNo", leaderProNo);
			view.setViewName("project/moreProject_mobile");
			return view;
			
		} else {
			System.out.println("세션 실패");
			return null;
		}
		
	}
	
	
	
	@Override
	@RequestMapping(value="updateProjectProgress.do")
	public void updateProjectProgress(HttpSession session, HttpServletResponse response, @RequestParam String proNoStr, @RequestParam String proProgress) {
		
		// 1. 업데이트 실행하기
		
		// 문자열 쪼개서 저장하기
		ProgressHelper ph = new ProgressHelper();
		StringTokenizer st = new StringTokenizer(proNoStr, ",");
		int cnt = st.countTokens();
		String[] proNoArr = new String[cnt];
		for(int i=0; i<cnt; i++) {
			proNoArr[i] = st.nextToken();	
		}
		ph.setProNo(proNoArr);
		ph.setProProgress(proProgress);
		
		int result = projectService.updateProjectProgress(ph);
		
		if(result>0) { // 2. 성공 시 다시 프로젝트 목록 읽어오기
			
			ArrayList<Project> projectList = this.projectList(session);
			System.out.println(projectList);
			ModelAndView view = new ModelAndView();
			view.addObject("projectList", projectList);
			
			response.setContentType("application/json");
			response.setCharacterEncoding("utf-8");
			 
			try {
				new Gson().toJson(projectList,response.getWriter());
			} catch (JsonIOException | IOException e) {
				e.printStackTrace();
			}
			
			
		} else {
			System.out.println("progress 변경 실패");
			
		}

	}
	

	@Override
	@RequestMapping(value="searchMoreProTitle.do")
	public Object searchMoreProTitle(@RequestParam int proNo) {
		
		String proTitle = projectService.searchMoreProTitle(proNo);
		ModelAndView view = new ModelAndView();
		view.addObject("proTitle", proTitle);
		view.setViewName("jsonView");
		return view;
		
	}
	
	// 프로젝트 삭제
	@Override
	@RequestMapping(value="deleteProject.do")
	public Object deleteProject(@RequestParam int proNo) {
		
		int result = projectService.deleteProject(proNo);
		if(result>0) {
			System.out.println("프로젝트 삭제 성공");
			ModelAndView view = new ModelAndView();
			view.addObject("result", result);
			view.setViewName("jsonView");
			return view;
		} else {
			System.out.println("프로젝트 삭제 실패");
			return null;
		}
		
	}
	
	
	// 프로젝트 날짜 수정
	@Override
	@RequestMapping(value="gotoProjectDateChange.do") // 이동
	public Object gotoProjectDateChange(@RequestParam int proNo) {
		
		// 프로젝트 정보 1개 읽어오기
		Project project = projectService.searchProjectInfo(proNo);
		ModelAndView view = new ModelAndView();
		view.addObject("project", project);
		view.setViewName("project/projectDateChange");
		return view;
		
	}
	

	@RequestMapping(value="gotoProjectDateChange_mobile.do") // 이동
	public Object gotoProjectDateChangeMobile(@RequestParam int proNo) {
		
		// 프로젝트 정보 1개 읽어오기
		Project project = projectService.searchProjectInfo(proNo);
		ModelAndView view = new ModelAndView();
		view.addObject("project", project);
		view.setViewName("project/projectDateChange_mobile");
		return view;
		
	}

	
	
	@Override
	@RequestMapping(value="updateProjectDate.do")
	public String updateProjectDate(Project project) {
		
		int result = projectService.updateProjectDate(project);
		if(result>0) {
			
			System.out.println("프로젝트 날짜 수정 성공");
			return "redirect:/gotoMoreProject.do";
			
		} else {
			System.out.println("프로젝트 날짜 수정 실패");
			return null;
			
		}
		
	}
	
	

	// ---------------------
	
	
	
	
	
	
	
	
	
	
	// --------------------- 승재오빠 부분
	

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
		System.out.println(invitingMemberList);
		view.addObject("memberInvitingProList", invitingMemberList);
		view.setViewName("jsonView");
		return view;
	}
	
	@RequestMapping(value="/acceptMember.do")
	public ModelAndView acceptMember(@RequestParam int memberNo, @RequestParam int proNo) {
		int result = projectService.acceptMember(memberNo, proNo);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="/checkLeader.do")
	public ModelAndView checkLeader(@RequestParam int proNo) {
		int memberNo = projectService.checkLeader(proNo);
		ModelAndView mav = new ModelAndView();
		mav.addObject("memberNo",memberNo);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@RequestMapping(value="/searchProMember.do")
	public ModelAndView searchProMember(@RequestParam int proNo, @RequestParam String searchMemberText) {
		ArrayList<WorkOnMember> list = projectService.searchProMember(proNo, searchMemberText);
		ModelAndView mav = new ModelAndView();
		mav.addObject("searchProMemberList", list);
		mav.setViewName("jsonView");
		return mav;
	}
}
