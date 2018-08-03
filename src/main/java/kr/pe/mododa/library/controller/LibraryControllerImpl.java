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
import kr.pe.mododa.library.model.vo.Decision;
import kr.pe.mododa.library.model.vo.Link;
import kr.pe.mododa.library.model.vo.Todo;
import kr.pe.mododa.library.model.vo.Upload;
import kr.pe.mododa.member.model.vo.Member;
import kr.pe.mododa.post.model.service.PostServiceImpl;
import kr.pe.mododa.project.model.vo.Project;

@Controller
public class LibraryControllerImpl implements LibraryController{

	@Autowired
	@Qualifier(value="libraryService")
	private LibraryServiceImpl libraryService;
	
	@Autowired
	@Qualifier(value="postService")
	private PostServiceImpl postService;
	
	// 할 일 페이지로 이동 (=자료실 메인페이지)
	@RequestMapping(value="/todo.do")
	public Object todo(HttpSession session) {
		if(session.getAttribute("member") != null) {
			int memberNo = ((Member)session.getAttribute("member")).getMemberNo();
			
			// 전체 할 일 리스트
			ArrayList<Todo> listTodo = libraryService.listTodo(memberNo);
			
			// 사용자가 속해 있는 프로젝트 리스트
			ArrayList<Project> listProject = libraryService.listProject(memberNo);

			// 프라이빗 공간 프로젝트 번호 가져오기
			int privateNo = libraryService.privateNo(memberNo);

			ModelAndView view = new ModelAndView();
			view.addObject("listProject", listProject);
			view.addObject("listTodo", listTodo);
			view.addObject("privateNo", privateNo);
			view.setViewName("library/todo");
			return view;
		}
		else {
			return "redirect:/index.jsp";
		}
	}
	
	// 의사결정 페이지로 이동
	@RequestMapping(value="/decision.do")
	public Object decision (HttpSession session) {
		if(session.getAttribute("member")!=null) { // 로그인 세션을 가져오기
			int memberNo = ((Member)session.getAttribute("member")).getMemberNo();
			
			// 전체 의사결정 리스트
			ArrayList<Decision> listDecision = libraryService.listDecision(memberNo);
			
			// 사용자가 속해 있는 프로젝트 리스트
			ArrayList<Project> listProject = libraryService.listProject(memberNo);
			
			// 프라이빗 공간 프로젝트 번호 가져오기
			int privateNo = libraryService.privateNo(memberNo);

			ModelAndView view = new ModelAndView();
			view.addObject("listDecision", listDecision);
			view.addObject("listProject", listProject);
			view.addObject("privateNo", privateNo);
			view.setViewName("library/decision");
			return view;
		}
		else {
			System.out.println("세션 에러");
			return "redirect:/index.jsp";
		}

	}
	
	// 이미지 페이지로 이동
	@RequestMapping(value="/image.do")
	public Object image (HttpSession session) {
		if(session.getAttribute("member")!=null) { // 로그인 세션을 가져오기

			int memberNo = ((Member)session.getAttribute("member")).getMemberNo();
			
			// 이미지 객체 리스트
			ArrayList<Upload> listImage = libraryService.listImage(memberNo);
			
			// 사용자가 속해 있는 프로젝트 리스트
			ArrayList<Project> listProject = libraryService.listProject(memberNo);
						
			// 프라이빗 공간 프로젝트 번호 가져오기
			int privateNo = libraryService.privateNo(memberNo);

			ModelAndView view = new ModelAndView();
			view.addObject("listImage", listImage);
			view.addObject("listProject", listProject);
			view.addObject("privateNo", privateNo);
			view.setViewName("library/image");
			return view;

		}
		else {
			System.out.println("세션 에러");
			return "redirect:/index.jsp";
		}
	}

	// 파일 페이지로 이동
	@RequestMapping(value="/file.do")
	public Object file (HttpSession session) {
		if(session.getAttribute("member")!=null) { // 로그인 세션을 가져오기

			int memberNo = ((Member)session.getAttribute("member")).getMemberNo();

			// 파일 객체 리스트
			ArrayList<Upload> listFile = libraryService.listFile(memberNo);
			
			// 사용자가 속해 있는 프로젝트 리스트
			ArrayList<Project> listProject = libraryService.listProject(memberNo);
									
			// 프라이빗 공간 프로젝트 번호 가져오기
			int privateNo = libraryService.privateNo(memberNo);

			// 파일 경로에서 파일명 추출
			for(int i=0; i<listFile.size(); i++) {
				String[] array = listFile.get(i).getUploadPath().split("/");
				for(int j=0; j<array.length; j++) {
					if(j == array.length-1) {
						listFile.get(i).setFileName(array[j]);
					}
				}
			}

			ModelAndView view = new ModelAndView();
			view.addObject("listFile", listFile);
			view.addObject("listProject", listProject);
			view.addObject("privateNo", privateNo);
			view.setViewName("library/file");
			return view;
		}
		else {
			System.out.println("세션 에러");
			return "redirect:/index.jsp";
		}
	}

	// 링크 페이지로 이동
	@RequestMapping(value="/link.do")
	public Object link (HttpSession session) {
		if(session.getAttribute("member")!=null) { // 로그인 세션을 가져오기

			int memberNo = ((Member)session.getAttribute("member")).getMemberNo();

			// 링크 객체 리스트
			ArrayList<Link> listLink = libraryService.listLink(memberNo);
			
			// 사용자가 속해 있는 프로젝트 리스트
			ArrayList<Project> listProject = libraryService.listProject(memberNo);
												
			// 프라이빗 공간 프로젝트 번호 가져오기
			int privateNo = libraryService.privateNo(memberNo);

			ModelAndView view = new ModelAndView();
			view.addObject("listLink", listLink);
			view.addObject("listProject", listProject);
			view.addObject("privateNo", privateNo);
			view.setViewName("library/link");
			return view;

		}
		else {
			System.out.println("세션 에러");
			return "redirect:/index.jsp";
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
	public String insertTodo(HttpSession session, @RequestParam int todoProNo, @RequestParam String todoTitle, @RequestParam int todoMember, @RequestParam String todoContent) {
		Todo todo = new Todo();
		todo.setTodoProNo(todoProNo);
		todo.setTodoTitle(todoTitle);
		todo.setTodoMember(todoMember);
		todo.setTodoContent(todoContent);
		todo.setTodoWriter(((Member)session.getAttribute("member")).getMemberNo());

		int result = libraryService.insertTodo(todo);

		if(result > 0) {
			return "library/insertTodo";
		}
		else {
			return "redirect:/index.jsp";
		}
	}

	// 전체 할 일 불러오기
	@RequestMapping(value="/listTodoAll.do")
	public void listTodoAll(HttpSession session, HttpServletResponse response) throws Exception {
		int memberNo = ((Member)session.getAttribute("member")).getMemberNo();

		ArrayList<Todo> listTodoAll = libraryService.listTodo(memberNo);

		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");

		new Gson().toJson(listTodoAll,response.getWriter());
	}

	// 내 할 일 불러오기
	@RequestMapping(value="/listTodoMe.do")
	public void listTodoMe(HttpSession session, HttpServletResponse response) throws Exception {
		int memberNo = ((Member)session.getAttribute("member")).getMemberNo();

		ArrayList<Todo> listTodoMe = libraryService.listTodoMe(memberNo);

		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");

		new Gson().toJson(listTodoMe,response.getWriter());
	}

	// 요청한 할 일 불러오기
	@RequestMapping(value="/listTodoRequest.do")
	public void listTodoRequest(HttpSession session, HttpServletResponse response) throws Exception {
		int memberNo = ((Member)session.getAttribute("member")).getMemberNo();

		ArrayList<Todo> listTodoRequest = libraryService.listTodoRequest(memberNo);

		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");

		new Gson().toJson(listTodoRequest,response.getWriter());
	}

	// 전체 의사결정 불러오기
	@RequestMapping(value="/listDcAll.do")
	public void listDcAll(HttpSession session, HttpServletResponse response) throws Exception {
		int memberNo = ((Member)session.getAttribute("member")).getMemberNo();

		ArrayList<Decision> listDcAll = libraryService.listDecision(memberNo);

		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");

		new Gson().toJson(listDcAll,response.getWriter());
	}

	// 받은 의사결정 불러오기
	@RequestMapping(value="/listDcMe.do")
	public void listDcMe(HttpSession session, HttpServletResponse response) throws Exception {
		int memberNo = ((Member)session.getAttribute("member")).getMemberNo();

		ArrayList<Decision> listDcMe = libraryService.listDcMe(memberNo);

		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");

		new Gson().toJson(listDcMe,response.getWriter());
	}

	// 요청한 의사결정 불러오기
	@RequestMapping(value="/listDcRequest.do")
	public void listDcRequest(HttpSession session, HttpServletResponse response) throws Exception {
		int memberNo = ((Member)session.getAttribute("member")).getMemberNo();

		ArrayList<Decision> listDcRequest = libraryService.listDcRequest(memberNo);

		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");

		new Gson().toJson(listDcRequest,response.getWriter());
	}

	// 전체 이미지 불러오기
	@RequestMapping(value="/listImageAll.do")
	public void listImageAll(HttpSession session, HttpServletResponse response) throws Exception {
		int memberNo = ((Member)session.getAttribute("member")).getMemberNo();

		ArrayList<Upload> listImageAll = libraryService.listImage(memberNo);

		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");

		new Gson().toJson(listImageAll,response.getWriter());
	}

	// 내 이미지 불러오기
	@RequestMapping(value="/listImageMe.do")
	public void listImageMe(HttpSession session, HttpServletResponse response) throws Exception {
		int memberNo = ((Member)session.getAttribute("member")).getMemberNo();

		ArrayList<Upload> listImageMe = libraryService.listImageMe(memberNo);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");

		new Gson().toJson(listImageMe,response.getWriter());
	}
	
	// 전체 파일 불러오기
	@RequestMapping(value="/listFileAll.do")
	public void listFileAll(HttpSession session, HttpServletResponse response) throws Exception {
		int memberNo = ((Member)session.getAttribute("member")).getMemberNo();

		ArrayList<Upload> listFileAll = libraryService.listFile(memberNo);
		
		// 파일 경로에서 파일명 추출
		for(int i=0; i<listFileAll.size(); i++) {
			String[] array = listFileAll.get(i).getUploadPath().split("/");
			for(int j=0; j<array.length; j++) {
				if(j == array.length-1) {
					listFileAll.get(i).setFileName(array[j]);
				}
			}
		}
		
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");

		new Gson().toJson(listFileAll,response.getWriter());
	}
	
	// 내 파일 불러오기
	@RequestMapping(value="/listFileMe.do")
	public void listFileMe(HttpSession session, HttpServletResponse response) throws Exception {
		int memberNo = ((Member)session.getAttribute("member")).getMemberNo();

		ArrayList<Upload> listFileMe = libraryService.listFileMe(memberNo);
		
		// 파일 경로에서 파일명 추출
		for(int i=0; i<listFileMe.size(); i++) {
			String[] array = listFileMe.get(i).getUploadPath().split("/");
			for(int j=0; j<array.length; j++) {
				if(j == array.length-1) {
					listFileMe.get(i).setFileName(array[j]);
				}
			}
		}
		
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");

		new Gson().toJson(listFileMe,response.getWriter());
	}

	// 전체 링크 불러오기
	@RequestMapping(value="/listLinkAll.do")
	public void listLinkAll(HttpSession session, HttpServletResponse response) throws Exception {
		int memberNo = ((Member)session.getAttribute("member")).getMemberNo();

		ArrayList<Link> listLinkAll = libraryService.listLink(memberNo);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");

		new Gson().toJson(listLinkAll,response.getWriter());
	}
	
	// 내 링크 불러오기
	@RequestMapping(value="/listLinkMe.do")
	public void listLinkMe(HttpSession session, HttpServletResponse response) throws Exception {
		int memberNo = ((Member)session.getAttribute("member")).getMemberNo();

		ArrayList<Link> listLinkMe = libraryService.listLinkMe(memberNo);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");

		new Gson().toJson(listLinkMe,response.getWriter());
	}

	
	// 의사결정 선택
	@RequestMapping(value="/updateDecision.do")
	public void updateDecision(HttpSession session, HttpServletResponse response, @RequestParam int dcNo, @RequestParam char dcDecision, @RequestParam String dcComment) throws Exception {
		System.out.println(dcNo);
		System.out.println(dcDecision);
		System.out.println(dcComment);
		Decision vo = new Decision();
		vo.setDcNo(dcNo);
		vo.setDcDecision(dcDecision);
		if(dcComment=="") {
			if(dcDecision=='Y') dcComment="승인합니다.";
			else dcComment="반려합니다.";
		}
		vo.setDcComment(dcComment);
		int result = libraryService.updateDecision(vo);
		
	}
	
	// 할 일 수정
	@RequestMapping(value="/updateTodo.do")
	public void updateTodo(HttpSession session, HttpServletResponse response, @RequestParam int todoNo, @RequestParam String todoTitle, @RequestParam String todoContent, @RequestParam int todoMember) throws Exception {
		System.out.println(todoNo);
		System.out.println(todoTitle);
		System.out.println(todoContent);
		System.out.println(todoMember);
		
		Todo t = new Todo();
		t.setTodoNo(todoNo);
		t.setTodoTitle(todoTitle);
		t.setTodoContent(todoContent);
		t.setTodoMember(todoMember);
		
		int result = libraryService.updateTodo(t);
		
	}
	
	// 게시글에 따라 회원정보 불러오기
	@RequestMapping(value="/todoContentMemberPost.do")
	public void todoContentMemberPost(HttpSession session, HttpServletResponse response, @RequestParam int todoPostNo) throws Exception {
		ArrayList<Member> list = libraryService.todoContentMemberPost(todoPostNo);

		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");

		new Gson().toJson(list,response.getWriter());
	}
	
	@RequestMapping(value="/todoContentMemberPro.do")
	public void todoContentMemberPro(HttpSession session, HttpServletResponse response, @RequestParam int todoProNo) throws Exception {
		System.out.println(todoProNo);
		ArrayList<Member> list = libraryService.selectMemberList(todoProNo);

		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");

		new Gson().toJson(list,response.getWriter());
	}
	
	
	
	
	
	
}
