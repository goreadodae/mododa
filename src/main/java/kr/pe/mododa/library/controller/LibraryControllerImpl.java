package kr.pe.mododa.library.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.pe.mododa.library.model.service.LibraryServiceImpl;
import kr.pe.mododa.library.model.vo.Link;
import kr.pe.mododa.library.model.vo.Todo;
import kr.pe.mododa.library.model.vo.Upload;
import kr.pe.mododa.member.model.vo.Member;
import kr.pe.mododa.project.model.service.ProjectServiceImpl;
import kr.pe.mododa.project.model.vo.Project;

@Controller
public class LibraryControllerImpl implements LibraryController{
	
	@Autowired
	@Qualifier(value="libraryService")
	private LibraryServiceImpl libraryService;
	
	
	// 자료실 메인 페이지로 이동
	@Autowired
	@RequestMapping(value="/libraryMain.do")
	public String libraryMainView () {
		return "library/libraryMain";
	}
	
	// 할 일 컨텐츠
	@Autowired
	@RequestMapping(value="/libraryTodoContent.do")
	public Object libraryTodoView (HttpSession session) {
		
		/*if(session.getAttribute("member")!=null) { // 로그인 세션을 가져오기

			int memberNo = ((Member)session.getAttribute("member")).getMemberNo();
		*/
			int memberNo = 1;
			
			// 할 일 리스트
			ArrayList<Todo> listTodo = libraryService.listTodo(memberNo);
			
			// 사용자가 속해 있는 프로젝트 리스트
			ArrayList<Project> listProject = libraryService.listProject(memberNo);
			
			// 사용자가 속해 있는 프로젝트의 팀원 리스트
			
			
			ModelAndView view = new ModelAndView();
			if(!listTodo.isEmpty()) {
				view.addObject("listTodo", listTodo);
				view.addObject("listProject", listProject);
				view.setViewName("library/libraryTodoContent");
				return view;
			}
			else {
				return view;
			}
			/*}
		else {
			System.out.println("세션 에러");
			return null;
		}*/
	}
	
	// 의사결정 컨텐츠
	@Autowired
	@RequestMapping(value="/libraryDecisionContent.do")
	public Object libraryDecisionView (HttpSession session) {
		/*if(session.getAttribute("member")!=null) { // 로그인 세션을 가져오기
			
			int memberNo = ((Member)session.getAttribute("member")).getMemberNo();
		*/
			int memberNo = 1;
			ArrayList<Todo> listDecision = libraryService.listDecision(memberNo);
			
			ModelAndView view = new ModelAndView();
			if(!listDecision.isEmpty()) {
				view.addObject("listDecision", listDecision);
				view.setViewName("library/libraryDecisionContent");
				return view;
			}
			else {
				return view;
			}
		
		/*}
		else {
			System.out.println("세션 에러");
			return null;
		}*/
		
	}
		
	// 이미지 컨텐츠
	@Autowired
	@RequestMapping(value="/libraryImageContent.do")
	public Object libraryImageView () {
		/*if(session.getAttribute("member")!=null) { // 로그인 세션을 가져오기
		
		int memberNo = ((Member)session.getAttribute("member")).getMemberNo();
	*/
		int memberNo = 1;
		ArrayList<Upload> listImage = libraryService.listImage(memberNo);
		
		ModelAndView view = new ModelAndView();
		if(!listImage.isEmpty()) {
			view.addObject("listImage", listImage);
			view.setViewName("library/libraryImageContent");
			return view;
		}
		else {
			return view;
		}
	
	/*}
	else {
		System.out.println("세션 에러");
		return null;
	}*/
	}
		
	// 파일 컨텐츠
	@Autowired
	@RequestMapping(value="/libraryFileContent.do")
	public Object libraryFileView () {
		/*if(session.getAttribute("member")!=null) { // 로그인 세션을 가져오기
		
		int memberNo = ((Member)session.getAttribute("member")).getMemberNo();
	*/
		int memberNo = 1;
		ArrayList<Upload> listFile = libraryService.listFile(memberNo);
		
		ModelAndView view = new ModelAndView();
		if(!listFile.isEmpty()) {
			view.addObject("listFile", listFile);
			view.setViewName("library/libraryFileContent");
			return view;
		}
		else {
			return view;
		}
	
	/*}
	else {
		System.out.println("세션 에러");
		return null;
	}*/
	}
		
	// 링크 컨텐츠
	@Autowired
	@RequestMapping(value="/libraryLinkContent.do")
	public Object libraryLinkView () {
	/*if(session.getAttribute("member")!=null) { // 로그인 세션을 가져오기
		
		int memberNo = ((Member)session.getAttribute("member")).getMemberNo();
	*/
		int memberNo = 1;
		ArrayList<Link> listLink = libraryService.listLink(memberNo);
		
		ModelAndView view = new ModelAndView();
		if(!listLink.isEmpty()) {
			view.addObject("listLink", listLink);
			view.setViewName("library/libraryLinkContent");
			return view;
		}
		else {
			return view;
		}
	
	/*}
	else {
		System.out.println("세션 에러");
		return null;
	}*/
	}
	

}
