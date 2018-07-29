package kr.pe.mododa.post.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.pe.mododa.calendar.model.vo.Schedule;
import kr.pe.mododa.library.model.vo.Decision;
import kr.pe.mododa.library.model.vo.Todo;
import kr.pe.mododa.member.model.vo.Member;
import kr.pe.mododa.post.model.service.PostServiceImpl;
import kr.pe.mododa.post.model.vo.Post;
import kr.pe.mododa.project.model.vo.Project;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class PostControllerImpl {
	@Autowired
	@Qualifier(value="postService")
	private PostServiceImpl postService;

	@Autowired
	@RequestMapping(value="/testareum.do")
	public String postView () {
		return "post/postDetail";
	}

	@Autowired
	@RequestMapping(value="/post.do")
	public String post () {
		return "post/postDetail";
	}

	//post 정보 불러오기
	@RequestMapping(value="/viewPost.do")
	public ModelAndView viewPost(HttpSession session, @RequestParam int postNo) {
		int memberNo=0;
		if(session.getAttribute("member")!=null) {
			memberNo = ((Member)session.getAttribute("member")).getMemberNo();
		}
		Project pro = postService.selectProject(postNo);
		Post p = postService.selectOnePost(postNo);
		List<Schedule> listSc = postService.selectSchedule(postNo);
		List<Todo> listTodo = postService.selectTodo(postNo);
		List<Member> listMember = postService.selectMembers(postNo);
		Decision decision = postService.selectDecision(postNo);

		JSONArray scheduleArray = new JSONArray();
		for(Schedule sc : listSc) {
			String start = (sc.getStartDate().getYear()+1900) + "-" + sc.getStartDate().getMonth()+ "-" + sc.getStartDate().getDay() ;
			String end = (sc.getEndDate().getYear()+1900) + "-" + sc.getEndDate().getMonth()+ "-" + sc.getEndDate().getDay() ;
			JSONObject schedule = new JSONObject();
			schedule.put("startDate",start);
			schedule.put("endDate",end);
			schedule.put("scTitle", sc.getScTitle());
			scheduleArray.add(schedule);
		}

		JSONArray todoArray = new JSONArray();
		for(Todo td : listTodo) {
			JSONObject todo = new JSONObject();
			todo.put("todoContent", td.getTodoContent());
			todo.put("todoMember", td.getTodoMemberName());
			todo.put("todoMemberPicture", td.getTodoMemberPicture());
			todoArray.add(todo);
		}

		JSONArray memberArray = new JSONArray();
		for(Member mem : listMember) {
			JSONObject member = new JSONObject();
			member.put("memberNo", mem.getMemberNo());
			member.put("memberName", mem.getMemberName());
			memberArray.add(member);
		}


		ModelAndView view = new ModelAndView();
		view.addObject("memberNo",memberNo);
		view.addObject("project",pro);
		view.addObject("post", p);
		view.addObject("schedule",scheduleArray);
		view.addObject("todo", todoArray);
		view.addObject("decision",decision);
		view.addObject("member",memberArray);
		view.setViewName("jsonView");
		return view;
	}

	//�븷�씪 異붽�
	@RequestMapping(value="/postInsertTodo.do")
	public ModelAndView insertTodo(HttpSession session, int postNo, String todoContent, int todoMember) {
		if(session.getAttribute("member")!=null) { // 濡쒓렇�씤 �꽭�뀡�쓣 媛��졇�삤湲�
			int todoWriter = ((Member)session.getAttribute("member")).getMemberNo();
			Todo vo = new Todo();
			vo.setTodoPostNo(postNo);
			vo.setTodoTitle(todoContent);
			vo.setTodoContent(todoContent);
			vo.setTodoWriter(todoWriter);
			vo.setTodoMember(todoMember);
			int result = postService.insertTodo(vo);

			Member mem = postService.selectMemberInfo(todoMember);

			ModelAndView view = new ModelAndView();
			view.addObject("result", result);
			view.addObject("todoMember",mem);
			view.setViewName("jsonView");
			return view;
		} 
		else {
			System.out.println("�꽭�뀡 �떎�뙣");
			ModelAndView view = new ModelAndView();
			view.addObject("result", -1);
			view.setViewName("jsonView");
			return view;
		}
	}

	//�씪�젙 異붽�
	@RequestMapping(value="/postInsertSchedule.do")
	public ModelAndView insertSchedule(HttpSession session, int postNo, @RequestParam String scTitle, @RequestParam Date startDate, @RequestParam Date endDate) {
		if(session.getAttribute("member")!=null) {
			int memNO = ((Member)session.getAttribute("member")).getMemberNo();

			Schedule vo = new Schedule();
			vo.setPostNo(postNo);
			vo.setMemNO(memNO);
			vo.setScTitle(scTitle);
			vo.setStartDate(startDate);
			vo.setEndDate(endDate);

			int result = postService.insertSchedule(vo);
			ModelAndView view = new ModelAndView();
			if(result>0) {
				view.addObject("result", result);
			}
			view.setViewName("jsonView");
			return view;
		}
		else {
			ModelAndView view = new ModelAndView();
			view.addObject("result", -1);
			view.setViewName("jsonView");
			return view;
		}
	}

	//�씠誘몄� �뙆�씪 �뾽濡쒕뱶
	@RequestMapping(value="/postFileUpload.do")
	public ModelAndView fileUp(MultipartHttpServletRequest multi) {

		// ���옣 寃쎈줈 �꽕�젙
		String root = multi.getSession().getServletContext().getRealPath("/");
		String path = root+"resources/upload/";

		String newFileName = ""; // �뾽濡쒕뱶 �릺�뒗 �뙆�씪紐�

		File dir = new File(path);
		if(!dir.isDirectory()){
			dir.mkdir();
		}

		Iterator<String> files = multi.getFileNames();
		while(files.hasNext()){
			String uploadFile = files.next();

			MultipartFile mFile = multi.getFile(uploadFile);
			String fileName = mFile.getOriginalFilename();
			System.out.println("�떎�젣 �뙆�씪 �씠由� : " +fileName);
			newFileName = System.currentTimeMillis()+"."
					+fileName.substring(fileName.lastIndexOf(".")+1);

			try {
				mFile.transferTo(new File(path+newFileName));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");
		return view;
	}

	//의사결정 추가
	@RequestMapping(value="/postInsertDecision.do")
	public ModelAndView insertDecision(HttpSession session, int postNo, @RequestParam int dcMaker, @RequestParam String dcContent) {
		if(session.getAttribute("member")!=null) {
			int dcWriter = ((Member)session.getAttribute("member")).getMemberNo();

			Decision vo = new Decision();
			vo.setDcPostNo(postNo);
			vo.setDcWriter(dcWriter);
			vo.setDcMaker(dcMaker);
			vo.setDcContent(dcContent);

			int result = postService.insertDecision(vo);

			Member writerMem = postService.selectMemberInfo(dcWriter);
			Member makerMem = postService.selectMemberInfo(dcMaker);

			ModelAndView view = new ModelAndView();
			if(result>0) {
				view.addObject("result", result);
				view.addObject("writerMem", writerMem);
				view.addObject("makerMem", makerMem);
			}
			view.setViewName("jsonView");
			return view;
		}
		else {
			ModelAndView view = new ModelAndView();
			view.addObject("result", -1);
			view.setViewName("jsonView");
			return view;
		}
	}

	//의사결정 삭제
	@RequestMapping(value="/postDeleteDecision.do")
	public ModelAndView deleteDecision(int postNo) {
		int result = postService.deleteDecision(postNo);
		ModelAndView view = new ModelAndView();
		view.addObject("result", result);
		view.setViewName("jsonView");
		return view;
	}

	//의사결정 승인/반려 선택
	@RequestMapping(value="/postUpdateDecision.do")
	public ModelAndView updateDecision(int postNo, char dcDecision, String dcComment) {
		Decision vo = new Decision();
		vo.setDcPostNo(postNo);
		vo.setDcDecision(dcDecision);
		if(dcComment=="") {
			if(dcDecision=='Y') dcComment="승인합니다.";
			else dcComment="반려합니다.";
		}
		vo.setDcComment(dcComment);
		int result = postService.updateDecision(vo);
		Decision decision = postService.selectDecision(postNo);

		ModelAndView view = new ModelAndView();
		view.addObject("result", result);
		view.addObject("decision", decision);
		view.setViewName("jsonView");
		return view;
	}

	//진행과정 변경
	@RequestMapping(value="/postUpdatePostProgress.do")
	public ModelAndView updatePostProgress(int postNo, String postProgress) {
		Post vo = new Post();
		vo.setPostNo(postNo);
		vo.setPostProgress(postProgress);
		int result = postService.updatePostProgress(vo);
		
		ModelAndView view = new ModelAndView();
		view.addObject("result", result);
		view.setViewName("jsonView");
		return view;
	}
}
