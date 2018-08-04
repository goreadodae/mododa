package kr.pe.mododa;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.pe.mododa.project.controller.ProjectControllerImpl;
import kr.pe.mododa.project.model.vo.Project;


@Controller
public class HomeController {
	
	@Autowired
	@Qualifier(value="projectController")
	private ProjectControllerImpl projectController;
	
	// 페이지 공통 부분 로드하는 컨트롤러
	@RequestMapping(value="/header.do")
	public String header() {
		return "main/header";
	}
	
	@RequestMapping(value="/projectHeader.do")
	public String projectHeader() {
		return "main/projectHeader";
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
	
	@RequestMapping(value="/rightbar.do")
	public String rightbar() {
		return "main/rightbar";
	}
	
	@RequestMapping(value="/loading.do")
	public String loading() {
		return "main/loading";
	}
	
}
