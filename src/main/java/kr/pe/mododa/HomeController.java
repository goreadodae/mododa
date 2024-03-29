package kr.pe.mododa;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.pe.mododa.library.model.service.LibraryServiceImpl;
import kr.pe.mododa.library.model.vo.Decision;
import kr.pe.mododa.library.model.vo.Todo;
import kr.pe.mododa.member.model.vo.Member;
import kr.pe.mododa.post.model.vo.Post;
import kr.pe.mododa.project.controller.ProjectControllerImpl;
import kr.pe.mododa.project.model.vo.Project;


@Controller
public class HomeController {
	
	@Autowired
	@Qualifier(value="projectController")
	private ProjectControllerImpl projectController;
	
	@Autowired
	@Qualifier(value="libraryService")
	private LibraryServiceImpl libraryService;
	
	// 페이지 공통 부분 로드하는 컨트롤러
	@RequestMapping(value="/header.do")
	public Object header(HttpSession session) {
		ArrayList<Project> projectList = projectController.projectWorkingList(session);
		Project privateProject = projectController.privateList(session);
		ModelAndView view = new ModelAndView();
		view.addObject("projectList", projectList);
		view.addObject("privateProject", privateProject);
		view.setViewName("main/header"); // 0728 수정
		return view;
	}
	
	@RequestMapping(value="/projectHeader.do")
	public Object projectHeader(HttpSession session) {
		ArrayList<Project> projectList = projectController.projectWorkingList(session);
		Project privateProject = projectController.privateList(session);
		ModelAndView view = new ModelAndView();
		view.addObject("projectList", projectList);
		view.addObject("privateProject", privateProject);
		view.setViewName("main/projectHeader"); // 0728 수정
		return view;
	}
	
	@RequestMapping(value="/leftbar.do")
	public Object leftbar(HttpSession session) {
		// 프로젝트 목록 읽어오기
		ArrayList<Project> projectList = projectController.projectWorkingList(session);
		Project privateProject = projectController.privateList(session);
		ModelAndView view = new ModelAndView();
		view.addObject("projectList", projectList);
		view.addObject("privateProject", privateProject);
		view.setViewName("main/leftbar"); // 0728 수정
		return view;
	}
	
	// rightbar에서 전체 내 할 일, 전체 의사결정
	@RequestMapping(value="/rightbar.do")
	public Object rightbar(HttpSession session) {
		int memberNo = ((Member)session.getAttribute("member")).getMemberNo();
		
		ArrayList<Todo> todoList = libraryService.listTodoMe(memberNo);
		ArrayList<Decision> decisionList = libraryService.listDcWait(memberNo);
		
		// 할 일 출력 5개 제한
		for(int i=todoList.size()-1; i>=5; i--) {
			todoList.remove(i);
		}
		System.out.println("todoList size : " + todoList.size());
		
		// 의사결정 출력 5개 제한
		for(int i=decisionList.size()-1; i>=5; i--) {
			decisionList.remove(i);
		}
		System.out.println("decisionList size : " + decisionList.size());
		
		ModelAndView view = new ModelAndView();
		view.addObject("todoList", todoList);
		view.addObject("decisionList", decisionList);
		view.setViewName("main/rightbar");
		return view;
	}
	
	// rightbar에서 프로젝트별로 내 할 일, 의사결정
	@RequestMapping(value="/rightbarPro.do")
	public Object rightbar(HttpSession session, @RequestParam int proNo) {
		int memberNo = ((Member)session.getAttribute("member")).getMemberNo();
		
		Post p = new Post();
		p.setPostWriter(memberNo);
		p.setPostProNo(proNo);
		
		ArrayList<Todo> todoList = libraryService.todoListPro(p);
		ArrayList<Decision> decisionList = libraryService.decisionListPro(p);
		
		ModelAndView view = new ModelAndView();
		view.addObject("todoList", todoList);
		view.addObject("decisionList", decisionList);
		view.setViewName("main/rightbar");
		return view;
	}
	
	@RequestMapping(value="/loading.do")
	public String loading() {
		return "main/loading";
	}
	
}
