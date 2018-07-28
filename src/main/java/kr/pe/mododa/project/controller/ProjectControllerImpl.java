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
import kr.pe.mododa.post.model.vo.Post;
import kr.pe.mododa.project.model.service.ProjectServiceImpl;
import kr.pe.mododa.project.model.vo.Project;



@Controller("projectController")
public class ProjectControllerImpl implements ProjectController {
	
	
	@Autowired
	@Qualifier(value="projectService")
	private ProjectServiceImpl projectService;
	

	@Override
	@RequestMapping(value="gotoCreateProject.do")
	public String gotoCreateProject() { // 이동
		return "project/createProject";
	}

	@Override
	@RequestMapping(value="createProject.do")
	public String createProject(HttpSession session, Project project) { // 새 프로젝트 생성 기능
		
		//System.out.println(project.toString());

		if(session.getAttribute("member")!=null) { // 세션으로 로그인 정보 가져오기
			
			// 로그인이랑 합쳐지면 if문 안으로 옮기기
			int proResult = projectService.insertProject(project);
			if(proResult>0) { // 프로젝트 생성이 성공하면 insertWorkOn 진행하기
				
				int wonResult = projectService.insertWorkOn(project.getProMemberNo());
				if(wonResult>0) {
					System.out.println("완전 성공");
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
	@RequestMapping(value="gotoInviteMember.do")
	public Object gotoInviteMember(HttpSession session) { // 이동

		// 프로젝트 목록 읽어오기
		ArrayList<Project> projectList = this.projectList(session);
		//System.out.println(projectList);
		ModelAndView view = new ModelAndView();
		view.addObject("projectList", projectList);
		view.setViewName("project/inviteMemberPage");
		return view;
		
	}

	
	@Override
	@RequestMapping(value="inviteMember.do")
	public String inviteMember(@RequestParam String memberId) {
		
		// work_on에 insert하기
		// 1. 회원 번호 검색
		int memberNo = projectService.searchMemberNo(memberId);
		// 2. 프로젝트 번호 받기 -> 넘겨 받기
		// 3. work_on에 insert하기
		System.out.println(memberNo);
		int result = projectService.insertInviteMember(memberNo);
		if(result>0) {
			return "redirect:/gotoInviteMember.do";
		} else {
			System.out.println("멤버초대실패");
			return null; // 실패했을 경우
		}
		
		
		
	}

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
	public Project privateProject(HttpSession session) { // 로그인 한 사용자의 프라이빗 프로젝트 읽어오기
		
		if(session.getAttribute("member")!=null) { // 로그인 세션을 가져오기
			
			int memberNo = ((Member)session.getAttribute("member")).getMemberNo();
			Project privateProject = projectService.searchPrivateProject(memberNo);
			return privateProject;
			
		} else {
			System.out.println("세션 실패");
			return null;
		}
	}
	
	
	@Override
	@RequestMapping(value="proPost.do")
	public Object proPost(@RequestParam int proNo) { // 프로젝트 글 목록 읽어오기
		// System.out.println("proPost: "+proNo);
		ArrayList<Post> postList = this.searchPostList(proNo);
		String proTitle = projectService.searchProTitle(proNo);
		ArrayList<Member> postWriterMemberList = this.postWriterMemberList(postList);
		// System.out.println(postWriterMemberList.toString());
		ModelAndView view = new ModelAndView();
		view.addObject("postList", postList);
		view.addObject("proTitle", proTitle);
		view.addObject("postWriterMemberList", postWriterMemberList);
		view.setViewName("project/projectPost");
		return view;
	}
	


	@Override
	@RequestMapping(value="priPost.do")
	public Object priPost(@RequestParam int proNo) { // 프라이빗 글 목록 읽어오기
		// System.out.println("proPost: "+proNo);
		ArrayList<Post> postList = this.searchPostList(proNo);
		Member member = projectService.searchMemberName(proNo);
		ModelAndView view = new ModelAndView();
		view.addObject("postList", postList);
		view.addObject("member", member);
		view.setViewName("project/privatePost");
		return view;
	}


	private ArrayList<Post> searchPostList(int proNo) { // 글 목록 읽어오는 공통 함수
		return projectService.searchPostList(proNo);
	}
	
	private ArrayList<Member> postWriterMemberList(ArrayList<Post> postList) {
		
		String [] postWriterNumberList = new String[postList.size()];
		
		for(int i=0; i<postList.size(); i++) {
			postWriterNumberList[i] = Integer.toString(postList.get(i).getPostWriter());
		}
		
		ArrayList<Member> postWriterMemberList = projectService.postWriterMemberList(postWriterNumberList);
		return postWriterMemberList;
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




	

}
