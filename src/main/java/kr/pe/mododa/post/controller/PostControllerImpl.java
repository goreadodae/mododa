package kr.pe.mododa.post.controller;

import java.io.File;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.pe.mododa.calendar.model.vo.Schedule;
import kr.pe.mododa.library.model.vo.Decision;
import kr.pe.mododa.library.model.vo.Todo;
import kr.pe.mododa.member.model.vo.Member;
import kr.pe.mododa.personal.model.vo.Bookmark;
import kr.pe.mododa.post.model.service.PostServiceImpl;
import kr.pe.mododa.post.model.vo.Comment;
import kr.pe.mododa.post.model.vo.Post;
import kr.pe.mododa.post.model.vo.PostLike;
import kr.pe.mododa.project.model.vo.Project;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class PostControllerImpl {
	@Autowired
	@Qualifier(value="postService")
	private PostServiceImpl postService;

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
		Bookmark bookmark = postService.selectBookmark(postNo, memberNo);//0801아름추가
		PostLike like = postService.selectPostLike(postNo, memberNo);//0801아름추가
		int likeCount = postService.selectPostLikeCount(postNo);//0801아름추가
		List<Schedule> listSc = postService.selectSchedule(postNo);
		List<Todo> listTodo = postService.selectTodo(postNo);
		List<Member> listMember = postService.selectMembers(postNo);
		Decision decision = postService.selectDecision(postNo);
		List<Comment> listComment = postService.selectComment(postNo); //댓글 읽어오는거 (준석 추가)

		JSONArray scheduleArray = new JSONArray();
		for(Schedule sc : listSc) {
			String start = (sc.getStartDate().getYear()+1900) + "-" + sc.getStartDate().getMonth()+ "-" + sc.getStartDate().getDay() ;
			String end = (sc.getEndDate().getYear()+1900) + "-" + sc.getEndDate().getMonth()+ "-" + sc.getEndDate().getDay() ;
			JSONObject schedule = new JSONObject();
			schedule.put("scNo",sc.getScheduleNo());
			schedule.put("startDate",start);
			schedule.put("endDate",end);
			schedule.put("scTitle", sc.getScTitle());
			scheduleArray.add(schedule);
		}

		JSONArray todoArray = new JSONArray();
		for(Todo td : listTodo) {
			JSONObject todo = new JSONObject();
			todo.put("todoNo", td.getTodoNo());
			todo.put("todoContent", td.getTodoContent());
			todo.put("todoMemberName", td.getTodoMemberName());//0801아름수정
			todo.put("todoMember", td.getTodoMember());//0801아름추가
			todo.put("todoMemberPicture", td.getTodoMemberPicture());
			todo.put("todoProgress", td.getTodoProgress());	//0801아름추가
			todoArray.add(todo);
		}

		JSONArray memberArray = new JSONArray();
		for(Member mem : listMember) {
			JSONObject member = new JSONObject();
			member.put("memberNo", mem.getMemberNo());
			member.put("memberName", mem.getMemberName());
			memberArray.add(member);
		}

		JSONArray commentArray = new JSONArray();
		for(Comment com : listComment) {
			JSONObject comment = new JSONObject();
			comment.put("writeNick", com.getWriteNick());
			comment.put("writePicture", com.getWritePicture());
			comment.put("writeTime", com.getWriteTime());
			comment.put("content", com.getContent());
			comment.put("postNo", com.getPostNo());
			comment.put("commentNo", com.getCommentNo());
			commentArray.add(comment);
		}


		ModelAndView view = new ModelAndView();
		view.addObject("memberNo",memberNo);
		view.addObject("project",pro);
		view.addObject("post", p);
		view.addObject("bookmark", bookmark);	//0801아름추가
		view.addObject("like", like);	//0801아름추가
		view.addObject("likeCount",likeCount);	//0801아름추가
		view.addObject("schedule",scheduleArray);
		view.addObject("todo", todoArray);
		view.addObject("decision",decision);
		view.addObject("member",memberArray);
		view.addObject("comment",commentArray);
		view.setViewName("jsonView");
		return view;
	}

	//할일 추가
	@RequestMapping(value="/postInsertTodo.do")
	public ModelAndView insertTodo(HttpSession session, int postNo, String todoContent, int todoMember) {
		if(session.getAttribute("member")!=null) {
			int todoWriter = ((Member)session.getAttribute("member")).getMemberNo();
			Todo vo = new Todo();
			vo.setTodoPostNo(postNo);
			vo.setTodoTitle(todoContent);
			vo.setTodoContent(todoContent);
			vo.setTodoWriter(todoWriter);
			vo.setTodoMember(todoMember);
			int result = postService.insertTodo(vo);

			//방금 추가한 todo의 번호 가져오기
			List<Todo> listTodo = postService.selectTodo(postNo);
			int todoNo = listTodo.get(0).getTodoNo();

			Member mem = postService.selectMemberInfo(todoMember);

			ModelAndView view = new ModelAndView();
			view.addObject("result", result);
			view.addObject("todoNo",todoNo);
			view.addObject("todoMember",mem);
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

	//일정 추가
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

	//게시글 진행과정 변경
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

	//할일 진행과정 변경
	@RequestMapping(value="/postUpdateTodoProgress.do")
	public ModelAndView updateTodoProgress(int todoNo, String todoProgress) {
		Todo vo = new Todo();
		vo.setTodoNo(todoNo);
		vo.setTodoProgress(todoProgress);
		int result = postService.updateTodoProgress(vo);

		ModelAndView view = new ModelAndView();
		view.addObject("result", result);
		view.setViewName("jsonView");
		return view;
	}

	//북마크 설정
	@RequestMapping(value="/postBookmarkOn.do")
	public ModelAndView insertBookmark(int postNo, int memberNo) {
		Bookmark vo = new Bookmark();
		vo.setPostNo(postNo);
		vo.setMemberNo(memberNo);
		int result = postService.insertBookmark(vo);
		ModelAndView view = new ModelAndView();
		view.addObject("result", result);
		view.setViewName("jsonView");
		return view;
	}

	//북마크 해제
	@RequestMapping(value="/postBookmarkOff.do")
	public ModelAndView deleteBookmark(int postNo, int memberNo) {
		Bookmark vo = new Bookmark();
		vo.setPostNo(postNo);
		vo.setMemberNo(memberNo);
		int result = postService.deleteBookmark(vo);
		ModelAndView view = new ModelAndView();
		view.addObject("result", result);
		view.setViewName("jsonView");
		return view;
	}

	//좋아요 설정
	@RequestMapping(value="/postLikeOn.do")
	public ModelAndView insertPostLike(int postNo, int memberNo) {
		PostLike vo = new PostLike();
		vo.setPostNo(postNo);
		vo.setMemberNo(memberNo);
		int result = postService.insertPostLike(vo);
		ModelAndView view = new ModelAndView();
		view.addObject("result", result);
		view.setViewName("jsonView");
		return view;
	}

	//좋아요 해제
	@RequestMapping(value="/postLikeOff.do")
	public ModelAndView deletePostLike(int postNo, int memberNo) {
		PostLike vo = new PostLike();
		vo.setPostNo(postNo);
		vo.setMemberNo(memberNo);
		int result = postService.deletePostLike(vo);
		ModelAndView view = new ModelAndView();
		view.addObject("result", result);
		view.setViewName("jsonView");
		return view;
	}
	
	//댓글 읽어오는거 (준석추가)
	@RequestMapping(value="/comment.do")
	public ModelAndView comment(@RequestParam int postNo)
	{
		ArrayList<Comment> commentList = postService.selectComment(postNo);
		ModelAndView view = new ModelAndView();
		view.addObject("comment",commentList);
		view.addObject("cmPostNo",postNo); //댓글이 없을경우를 대비해 글번호를 넘겨줌.(댓글 작성시 필요함.)
		view.setViewName("/post/postComment");
		return view;
	}
	
	@RequestMapping(value="/insertComment.do")
	public Object insertComment(HttpSession session,@RequestParam int postNo, @RequestParam String insertCom)
	{
		System.out.println("글 번호:"+postNo + "내용:"+insertCom);
		Post vo = new Post();
		
		vo.setPostNo(postNo);//댓글 작성할 글 번호
		vo.setPostContent(insertCom); //댓글 내용
		vo.setPostWriter(((Member)session.getAttribute("member")).getMemberNo());//댓글 작성한 회원 번호(세션에서 가져옴.)
		int result = postService.insertComment(vo);
		
		System.out.println(result);
		ArrayList<Comment> commentList = postService.selectComment(postNo);
		
		ModelAndView view = new ModelAndView();
		view.addObject("comment",commentList);
		view.addObject("cmPostNo",postNo); //댓글이 없을경우를 대비해 글번호를 넘겨줌.(댓글 작성시 필요함.)
		view.setViewName("/post/postComment");
		return view;
	}
}