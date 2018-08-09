package kr.pe.mododa.write.controller;
 import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
 import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
 import com.google.gson.Gson;
import com.google.gson.JsonIOException;
 import kr.pe.mododa.calendar.model.vo.Schedule;
import kr.pe.mododa.library.model.vo.Upload;
import kr.pe.mododa.member.model.vo.Member;
import kr.pe.mododa.post.model.vo.Post;
import kr.pe.mododa.project.model.vo.Project;
import kr.pe.mododa.write.model.service.WriteServiceImpl;
import kr.pe.mododa.write.model.vo.CallPost;
import kr.pe.mododa.write.model.vo.Partners;
import kr.pe.mododa.write.model.vo.PrivateSpace;
import kr.pe.mododa.write.model.vo.ProjectMember;
import kr.pe.mododa.write.model.vo.RelatedPost;
import kr.pe.mododa.write.model.vo.RelationSearchKey;
import kr.pe.mododa.write.model.vo.RelationWriting;
 @Controller
public class WriteControllerImpl  implements WriteController {
 	@Autowired
	private WriteServiceImpl writeService;
	
 	@Autowired
	@RequestMapping(value = "/write.do")
	public String writeReady() {
		
		return "write/writePage";
	}
/* 	@RequestMapping(value = "/projectNameList.do")
	public void autoComplete(HttpServletRequest request, HttpServletResponse response, @RequestParam int memberNo)
			throws Exception {
		Project pj = new Project();
		ModelAndView mav = new ModelAndView();
 		ArrayList<Project> list = writeService.autoComplete(memberNo);
		response.setContentType("apllication/json");
		response.setCharacterEncoding("utf-8");
 		new Gson().toJson(list, response.getWriter());
 	}*/
	
	@RequestMapping(value="/setPrivateSpace.do")
	public ModelAndView setPrivateSpace(HttpSession session) {
		int memberNo = ((Member)session.getAttribute("member")).getMemberNo();
		int myPrivateNo = writeService.setPrivateSpace(memberNo);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("jsonView");
		mav.addObject("myPrivateNo",myPrivateNo);	
		return mav;
		
	}
 	
	@RequestMapping(value ="/writePage.do")
	public ModelAndView currentProName(HttpServletResponse response, @RequestParam int currentProjectNo, HttpSession session) {
		Project pj = new Project();
		int memberNo = ((Member)session.getAttribute("member")).getMemberNo();
		pj.setProMemberNo(memberNo);
		pj.setProNo(currentProjectNo);
		PrivateSpace ps = new PrivateSpace();
		System.out.println(currentProjectNo+"현재 프로젝트 번호는?");
		System.out.println(memberNo);
		 ps = writeService.privateSpace(memberNo);
		String currentProName = writeService.currentProName(pj);
		ArrayList<Project> proList = writeService.myProject(memberNo);
		ArrayList<ProjectMember> proMember = writeService.projectMember(pj);
		String myPicture = writeService.myPicture(memberNo);
		System.out.println(currentProName);
		ModelAndView view = new ModelAndView();
		view.setViewName("/write/writePage");
		view.addObject("currentProName",currentProName);
		view.addObject("currentProNo",currentProjectNo);
		view.addObject("proList",proList);
		view.addObject("myPicture",myPicture);
		view.addObject("proMember",proMember);
		view.addObject("myPrivateSpace", ps);
		return view;
		
 	}
	
	@RequestMapping(value="/relationWritingList.do")
	public void relationWritingList(HttpServletResponse response, @RequestParam int currentProNo) throws Exception{
		
		ArrayList<RelationWriting> list = writeService.relationWritingList(currentProNo);
		response.setContentType("aplication/json");
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(list,response.getWriter());
	}
	
	
	@RequestMapping(value="/searchWriting.do")
	public void searchWriting(HttpServletResponse response, @RequestParam String searchKeyword, @RequestParam int currentProNo) throws Exception{
		ModelAndView view = new ModelAndView();		
		RelationSearchKey rsKey = new RelationSearchKey();
		rsKey.setSearchKeyword(searchKeyword);
		rsKey.setCurrentProNo(currentProNo);	
		ArrayList<RelationWriting> searchProList = writeService.searchWriting(rsKey);
		response.setContentType("aplication/json");
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(searchProList,response.getWriter());
		
		
		
	}
	
	@RequestMapping(value="/loadByProName.do")
	public void loadByProName(HttpServletResponse response, @RequestParam int proNo, HttpSession session) throws JsonIOException, IOException {
		RelationWriting rw = new RelationWriting();
		rw.setPostWriter((((Member)session.getAttribute("member")).getMemberNo()));
		rw.setPostProNo(proNo);
		ArrayList<RelationWriting> list = writeService.loadByProName(rw);
		response.setContentType("aplication/json");
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(list,response.getWriter());
		
		
	}
	
	@RequestMapping(value="/insertPost.do")
	public String insertPost(HttpServletRequest request,@RequestParam int currentProNo, 
			@RequestParam(value="writeTitle",required=true) String writeTitle, 
			@RequestParam(value="inputContents",required=true) String inputContents,
			@RequestParam(value="hashResults",required=false) String[] hashResults,
			@RequestParam(value="startDate",required=false) Date[] startDate,
			@RequestParam(value="endDate",required=false) Date[] endDate,
			@RequestParam(value="scheTitle",required=false) String[] scheTitle,
			@RequestParam(value="rpPostNo", required=false) int[] rpPostNo,
			@RequestParam(value="rpPostProNo", required=false) int[] rpPostProNo,
			@RequestParam(value="calledPartner", required=false) int[] calledPartner,
			@RequestParam(value="files", required=false)MultipartFile[] files, HttpSession session )  {
		System.out.println(currentProNo+"지금은 여기 입니당!");
		
		for(int i=0; i<files.length; i++)
		{
			System.out.println(files[i]+"하나 들어감"+i);
			
		}
		
		
		
		Post post = new Post();
		String hashTag ="";
		int memberNo =(((Member)session.getAttribute("member")).getMemberNo());		
		post.setPostProNo(currentProNo);
		post.setPostTitle(writeTitle);
		post.setPostContent(inputContents);
		post.setPostWriter(memberNo);
		Upload upload = new Upload();
		
		RelatedPost rpPost = new RelatedPost();
		if(hashResults!=null)
		{
			for(int i=0; i<hashResults.length; i++)
			{
				hashTag += hashResults[i];
			}
			post.setPostTag(hashTag);
			
		}	
		int postResult = writeService.insertPostToProject(post);
		//포스트 생성 완료하면!! 그에 따른 이미지, 일정, 관련글을 인설트 해주어야 함!
		if(postResult>0)
		{
			
			if(files.length <= 1)
			{
				upload.setMemberNo(memberNo);
				int result = writeService.uploadFile(files,upload);		
				if(result>0)
				{
					System.out.println("파일 업로드 성공!");
					
				}
				
			}
			else {
				System.out.println("이미지 추가 안했어요");
			}
			
			if(startDate != null)
			{
				
				Schedule sche = new Schedule();
				int scheResult = 0;
				for(int i=0; i<startDate.length; i++)
				{
					
					sche.setStartDate(startDate[i]);
					System.out.println(sche.getStartDate());
					sche.setEndDate(endDate[i]);
					System.out.println(sche.getEndDate());
					sche.setScTitle(scheTitle[i]);
					System.out.println(sche.getScTitle());
					sche.setMemNO(memberNo);
					sche.setProNo(currentProNo);
					 scheResult = writeService.insertSchedules(sche);
				}
				
				if(scheResult>0)
				{
					System.out.println("스케쥴 성공");
				}
			}
			else {
				
				System.out.println("일정 게시 실패");
			}
			
			
			if(rpPostNo != null)
			{
				int rpResult = 0;
				for(int i=0; i<rpPostNo.length; i++)
				{
					rpPost.setRpNo(rpPostNo[i]);
					rpPost.setProjectNo(rpPostProNo[i]);
					rpResult = writeService.insertRpPost(rpPost);
					
				}
				
				if(rpResult>0)
				{
					
					System.out.println("관련글 불러오기 성공!");
					
				}
				else {
					System.out.println("관련글 불러오기 실패");
				}
				
			}
			
			if(calledPartner !=  null)
			{
				CallPost cp = new CallPost();
				int cpResult = 0;
				for(int i=0; i<calledPartner.length; i++)
				{
					cp.setCallMember(calledPartner[i]);
					cpResult = writeService.insertCallMember(cp);
					if(cpResult >0)
					{
						System.out.println("파트너 불러오기 성공!");
					}
				}
			}

		}

		System.out.println(post.getPostTag());
		
		System.out.println(currentProNo+"현재 프로젝트 번호");
		Upload vo = new Upload();
		vo.setMemberNo(((Member)session.getAttribute("member")).getMemberNo());
		
		return "redirect:/index.jsp";
		
	}
	
	@RequestMapping(value="/tempInsertPost.do")
	public void tempInsertPost(HttpServletRequest request,@RequestParam int currentProNo, 
			@RequestParam(value="writeTitle",required=true) String writeTitle, 
			@RequestParam(value="inputContents",required=true) String inputContents,
			@RequestParam(value="hashResults",required=false) String[] hashResults,
			@RequestParam(value="startDate",required=false) Date[] startDate,
			@RequestParam(value="endDate",required=false) Date[] endDate,
			@RequestParam(value="scheTitle",required=false) String[] scheTitle,
			@RequestParam(value="rpPostNo", required=false) int[] rpPostNo,
			@RequestParam(value="rpPostProNo", required=false) int[] rpPostProNo,
			@RequestParam(value="calledPartner", required=false) int[] calledPartner,
			@RequestParam(value="files", required=false)MultipartFile[] files, HttpSession session ) {
		
		
		
		
		
		
	}
	

	@RequestMapping(value="/convertProName.do")
	public ModelAndView convertProName(HttpServletResponse response, @RequestParam int proNo, HttpSession session) throws JsonIOException, IOException {
		int memberNo = ((Member)session.getAttribute("member")).getMemberNo();
		Project vo = new Project();
		vo.setProNo(proNo);
		vo.setProMemberNo(memberNo);
		
		String convertedProName = writeService.currentProName(vo);
		ArrayList<ProjectMember> proMember = writeService.projectMember(vo);
		ModelAndView mav = new ModelAndView();
		mav.addObject("currentProName",convertedProName);
		mav.addObject("proMember",proMember);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	@RequestMapping(value="/myPartners.do")
	public ModelAndView myPartners(HttpSession session,@RequestParam int privateNo) {
		ModelAndView mav = new ModelAndView();
		Project vo = new Project();
		int memberNo = ((Member)session.getAttribute("member")).getMemberNo();
		vo.setProMemberNo(memberNo);
		vo.setProNo(privateNo);
		String privateSpace = writeService.currentProName(vo);
		
		ArrayList<Partners> partners = writeService.myPartners(memberNo);
		mav.addObject("partners",partners);
		mav.addObject("privateSpace", privateSpace);
		mav.setViewName("jsonView");
		return mav;
		
		
	}
	
	
		
		
		
		
		
		
	}
	