package kr.pe.mododa.library.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
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
			
			// resource 부터 시작하는 이미지 경로 추출
			for(int i=0; i<listImage.size(); i++) {
				String[] array = listImage.get(i).getUploadPath().split("resources");
				for(int j=0; j<array.length; j++) {
					if(j == array.length-1) {
						listImage.get(i).setUploadPath(array[j]);
					}
				}
				listImage.get(i).setUploadPath("/resources"+listImage.get(i).getUploadPath().replace("\\", "/"));
			}
			
			// 파일명 추출
			for(int i=0; i<listImage.size(); i++) {
				String[] array = listImage.get(i).getUploadPath().split("\\\\");
				for(int j=0; j<array.length; j++) {
					if(j == array.length-1) {
						listImage.get(i).setFileName(array[j]);
					}
				}
			}
			
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
				String[] array = listFile.get(i).getUploadPath().split("\\\\");
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

	// 할 일 분류
	@RequestMapping(value="/todoCategory.do")
	public void todoCategory(HttpSession session, HttpServletResponse response, @RequestParam int data) throws Exception {
		int memberNo = ((Member)session.getAttribute("member")).getMemberNo();
		
		ArrayList<Todo> listTodo = null;
		
		if(data == 1) {
			listTodo = libraryService.listTodo(memberNo);
		}
		else if(data == 2) {
			listTodo = libraryService.listTodoMe(memberNo);
		}
		else {
			listTodo = libraryService.listTodoRequest(memberNo);
		}
		
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");

		new Gson().toJson(listTodo,response.getWriter());
	}
	
	// 의사결정 분류
	@RequestMapping(value="/dcCategory.do")
	public void dcCategory(HttpSession session, HttpServletResponse response, @RequestParam int data) throws Exception {
		int memberNo = ((Member)session.getAttribute("member")).getMemberNo();
		
		ArrayList<Decision> listDecision = null;
		
		if(data == 1) {
			listDecision = libraryService.listDecision(memberNo);
		}
		else if(data == 2) {
			listDecision = libraryService.listDcMe(memberNo);
		}
		else {
			listDecision = libraryService.listDcRequest(memberNo);
		}
		
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
	
		new Gson().toJson(listDecision,response.getWriter());
	}
	
	// 이미지 분류
	@RequestMapping(value="/imageCategory.do")
	public void imageCategory(HttpSession session, HttpServletResponse response, @RequestParam int data) throws Exception {
		int memberNo = ((Member)session.getAttribute("member")).getMemberNo();
				
		ArrayList<Upload> listImage = null;
				
		if(data == 1) {
			listImage = libraryService.listImage(memberNo);
		}
		else {
			listImage = libraryService.listImageMe(memberNo);
		}
			
		// 파일 경로에서 파일명 추출
		for(int i=0; i<listImage.size(); i++) {
			String[] array = listImage.get(i).getUploadPath().split("\\\\");
			for(int j=0; j<array.length; j++) {	
				if(j == array.length-1) {
					listImage.get(i).setFileName(array[j]);
				}
			}	
		}
		
		// resource 부터 시작하는 이미지 경로 추출
		for(int i=0; i<listImage.size(); i++) {
			String[] array = listImage.get(i).getUploadPath().split("resources");
			for(int j=0; j<array.length; j++) {
				if(j == array.length-1) {
					listImage.get(i).setUploadPath(array[j]);
				}
			}
			listImage.get(i).setUploadPath("/resources"+listImage.get(i).getUploadPath().replace("\\", "/"));
		}
			
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");

		new Gson().toJson(listImage,response.getWriter());
	}
		
	// 파일 분류
	@RequestMapping(value="/fileCategory.do")
	public void fileCategory(HttpSession session, HttpServletResponse response, @RequestParam int data) throws Exception {
		int memberNo = ((Member)session.getAttribute("member")).getMemberNo();
			
		ArrayList<Upload> listFile = null;
			
		if(data == 1) {
			listFile = libraryService.listFile(memberNo);
		}
		else {
			listFile = libraryService.listFileMe(memberNo);
		}
			
		// 파일 경로에서 파일명 추출
		for(int i=0; i<listFile.size(); i++) {
			String[] array = listFile.get(i).getUploadPath().split("\\\\");
			for(int j=0; j<array.length; j++) {	
				if(j == array.length-1) {
					listFile.get(i).setFileName(array[j]);
				}
			}	
		}
			
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");

		new Gson().toJson(listFile,response.getWriter());
			
	}

	// 의사결정 선택
	@RequestMapping(value="/updateDecision.do")
	public void updateDecision(HttpSession session, HttpServletResponse response, @RequestParam int dcNo, @RequestParam char dcDecision, @RequestParam String dcComment) throws Exception {
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
	
	// 프로젝트 번호에 따라 회원정보 불러오기
	@RequestMapping(value="/todoContentMemberPro.do")
	public void todoContentMemberPro(HttpSession session, HttpServletResponse response, @RequestParam int todoProNo) throws Exception {
		ArrayList<Member> list = libraryService.selectMemberList(todoProNo);

		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");

		new Gson().toJson(list,response.getWriter());
	}
	
	// 할 일 삭제
	@RequestMapping(value="/deleteTodo.do")
	public void deleteTodo(HttpSession session, HttpServletResponse response, @RequestParam int todoNo) throws Exception {
		int result = libraryService.deleteTodo(todoNo);
	}
	
	// 의사결정 삭제
	@RequestMapping(value="/deleteDecision.do")
	public void deleteDecision(HttpSession session, HttpServletResponse response, @RequestParam int dcNo) throws Exception{
		int result = libraryService.deleteDecision(dcNo);
	}
	
	// 파일 다운로드
	@RequestMapping(value="/fileDownload.do")
	public void fileDownload(HttpServletResponse response, HttpServletRequest request, @RequestParam int uploadNo) throws Exception {
		Upload u = libraryService.uploadPath(uploadNo);
		
		File file = new File(u.getUploadPath());
		
		// 파일 경로에서 파일명 추출
		String fileName = null;
		String[] array = u.getUploadPath().split("\\\\");
		for(int j=0; j<array.length; j++) {	
			if(j == array.length-1) {
				fileName = array[j];
			}
		}
	 
	    FileInputStream fileInputStream = null;
	    ServletOutputStream servletOutputStream = null;
	 
	    try{
	        String downName = null;
	        String browser = request.getHeader("User-Agent");
	        //파일 인코딩
	        if(browser.contains("MSIE") || browser.contains("Trident") || browser.contains("Chrome")){//브라우저 확인 파일명 encode  
	        	downName = URLEncoder.encode(fileName,"UTF-8").replace("+", "%20");
	        }
	        else{
	            downName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1").replace("+", "%20");
	        }
	        
	         
	        response.setHeader("Content-Disposition","attachment;filename=\"" + downName+"\"");             
	        response.setContentType("application/octer-stream");
	        response.setHeader("Content-Transfer-Encoding", "binary;");
	 
	        fileInputStream = new FileInputStream(file);
	        servletOutputStream = response.getOutputStream();
	 
	        byte b [] = new byte[1024];
	        int data = 0;
	 
	        while((data=(fileInputStream.read(b, 0, b.length))) != -1){
	            servletOutputStream.write(b, 0, data);
	        }
	        servletOutputStream.flush();//출력
	         
	    }catch (Exception e) {
	        e.printStackTrace();
	    }finally{
	        if(servletOutputStream!=null){
	            try{
	                servletOutputStream.close();
	            }catch (IOException e){
	                e.printStackTrace();
	            }
	        }
	        if(fileInputStream!=null){
	            try{
	                fileInputStream.close();
	            }catch (IOException e){
	                e.printStackTrace();
	            }
	        }
	    }
		
	}
	
	// 파일, 이미지 삭제
	@RequestMapping(value="/deleteUpload.do")
	public void deleteUpload(HttpServletResponse response, HttpServletRequest request,@RequestParam int uploadNo) throws Exception {
		int result = libraryService.deleteUpload(uploadNo);
	}
	
	
}
