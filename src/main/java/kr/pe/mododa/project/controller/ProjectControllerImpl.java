package kr.pe.mododa.project.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
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
		
		return "redirect:/gotoInviteMember.do";
		
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
	@RequestMapping(value="proPost.do")
	public Object proPost(@RequestParam int proNo) {
		System.out.println("proPost: "+proNo);
		ArrayList<Post> proPostList = this.searchProPostList(proNo);
		ModelAndView view = new ModelAndView();
		view.addObject("proPostList", proPostList);
		view.setViewName("project/projectPost");
		return view;
	}


	private ArrayList<Post> searchProPostList(int proNo) {
		return projectService.searchProPostList(proNo);
	}


	

}
