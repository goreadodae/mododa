package kr.pe.mododa.library.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import kr.pe.mododa.library.model.service.LibraryServiceImpl;
import kr.pe.mododa.library.model.vo.Link;
import kr.pe.mododa.library.model.vo.Todo;
import kr.pe.mododa.library.model.vo.Upload;
import kr.pe.mododa.member.model.vo.Member;
import kr.pe.mododa.project.model.vo.Project;

@Controller
public class LibraryControllerImpl implements LibraryController{

	@Autowired
	@Qualifier(value="libraryService")
	private LibraryServiceImpl libraryService;


	// 자료실 메인 페이지로 이동
	@RequestMapping(value="/libraryMain.do")
	public Object libraryMainView (HttpSession session) {

		if(session.getAttribute("member") != null) {
			int memberNo = ((Member)session.getAttribute("member")).getMemberNo();

			// 사용자가 속해 있는 프로젝트 리스트
			ArrayList<Project> listProject = libraryService.listProject(memberNo);

			// 사용자가 속해 있는 프로젝트의 팀원 리스트

			ModelAndView view = new ModelAndView();
			view.addObject("listProject", listProject);
			view.setViewName("library/libraryMain");
			return view;
		}
		else {
			return "redirect:/index.jsp";
		}




	}

	// 할 일 컨텐츠
	@RequestMapping(value="/libraryTodoContent.do")
	public Object libraryTodoView (HttpSession session) {

		if(session.getAttribute("member")!=null) { // 로그인 세션을 가져오기
			int memberNo = ((Member)session.getAttribute("member")).getMemberNo();

			// 할 일 리스트
			ArrayList<Todo> listTodo = libraryService.listTodo(memberNo);

			// 사용자가 속해 있는 프로젝트 리스트
			ArrayList<Project> listProject = libraryService.listProject(memberNo);

			// 사용자가 속해 있는 프로젝트의 팀원 리스트


			ModelAndView view = new ModelAndView();

			view.addObject("listTodo", listTodo);
			view.addObject("listProject", listProject);
			view.setViewName("library/libraryTodoContent");
			return view;

		}
		else {
			System.out.println("세션 에러");
			return null;
		}
	}

	// 의사결정 컨텐츠
	@RequestMapping(value="/libraryDecisionContent.do")
	public Object libraryDecisionView (HttpSession session) {
		if(session.getAttribute("member")!=null) { // 로그인 세션을 가져오기
			int memberNo = ((Member)session.getAttribute("member")).getMemberNo();

			ArrayList<Todo> listDecision = libraryService.listDecision(memberNo);

			ModelAndView view = new ModelAndView();
			view.addObject("listDecision", listDecision);
			view.setViewName("library/libraryDecisionContent");
			return view;
		}
		else {
			System.out.println("세션 에러");
			return null;
		}

	}

	// 이미지 컨텐츠
	@RequestMapping(value="/libraryImageContent.do")
	public Object libraryImageView (HttpSession session) {
		if(session.getAttribute("member")!=null) { // 로그인 세션을 가져오기

			int memberNo = ((Member)session.getAttribute("member")).getMemberNo();

			ArrayList<Upload> listImage = libraryService.listImage(memberNo);

			ModelAndView view = new ModelAndView();
			view.addObject("listImage", listImage);
			view.setViewName("library/libraryImageContent");
			return view;

		}
		else {
			System.out.println("세션 에러");
			return null;
		}
	}

	// 파일 컨텐츠
	@RequestMapping(value="/libraryFileContent.do")
	public Object libraryFileView (HttpSession session) {
		if(session.getAttribute("member")!=null) { // 로그인 세션을 가져오기

			int memberNo = ((Member)session.getAttribute("member")).getMemberNo();
			
			// 파일 객체에 대한 리스트
			ArrayList<Upload> listFile = libraryService.listFile(memberNo);
			
			// 파일명에 대한 리스트
			ArrayList<String> fileName = new ArrayList<String>();
			
			// 파일 경로에서 파일명 추출
			for(int i=0; i<listFile.size(); i++) {
				String[] array = listFile.get(i).getUploadPath().split("/");
				for(int j=0; j<array.length; j++) {
					if(j == array.length-1) {
						fileName.add(array[j]);
					}
				}
			}
			
			ModelAndView view = new ModelAndView();
			view.addObject("fileName", fileName);
			view.addObject("listFile", listFile);
			view.setViewName("library/libraryFileContent");
			return view;
		}
		else {
			System.out.println("세션 에러");
			return null;
		}
	}

	// 링크 컨텐츠
	@RequestMapping(value="/libraryLinkContent.do")
	public Object libraryLinkView (HttpSession session) {
		if(session.getAttribute("member")!=null) { // 로그인 세션을 가져오기

			int memberNo = ((Member)session.getAttribute("member")).getMemberNo();

			ArrayList<Link> listLink = libraryService.listLink(memberNo);

			ModelAndView view = new ModelAndView();
			view.addObject("listLink", listLink);
			view.setViewName("library/libraryLinkContent");
			return view;

		}
		else {
			System.out.println("세션 에러");
			return null;
		}
	}
	
	// 프로젝트 선택에 따라 팀원 리스트 변경
	@RequestMapping(value="/selectMemberList.do")
	public void selectMemberList(HttpServletResponse response, @RequestParam int proNo) throws Exception {
		ArrayList<Member> list = libraryService.selectMemberList(proNo);

		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");

		new Gson().toJson(list,response.getWriter());
	}
	
	// 할 일 추가
	@RequestMapping(value="/insertTodo.do")
	public String insertTodo(HttpSession session, @RequestParam int todoProNo, @RequestParam String todoTitle, @RequestParam int todoMember) {
		Todo todo = new Todo();
		todo.setTodoProNo(todoProNo);
		todo.setTodoTitle(todoTitle);
		todo.setTodoMember(todoMember);
		todo.setTodoWriter(((Member)session.getAttribute("member")).getMemberNo());
		
		int result = libraryService.insertTodo(todo);
		
		if(result > 0) {
			return "redirect:/index.jsp";
		}
		else {
			return "redirect:/index.jsp";
		}
	}


}
