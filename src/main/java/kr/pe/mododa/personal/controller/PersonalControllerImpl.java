package kr.pe.mododa.personal.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.pe.mododa.personal.model.service.PersonalServiceImpl;
import kr.pe.mododa.personal.model.vo.Bookmark;
import kr.pe.mododa.personal.model.vo.Mypost;
import kr.pe.mododa.post.model.vo.Post;

@Controller
public class PersonalControllerImpl implements PersonalController{
	
	@Autowired
	@Qualifier(value="personalService")
	private PersonalServiceImpl personalService;
	
//	@RequestMapping(value="newsfeed.do") //뉴스피드....
//	@Override
//	public Object newsfeed() //속한 프로젝트의 모든 글을 가져옴..
//	{
//		HttpSession session = request.getSession();
//		int memberNo = 1; //(((Member)session.getAttribute("member")).getMemberNo());
//		ArrayList<Newsfeed> newsfeed = personalService.selectAllNewsFeed(memberNo);
//		
//		//
		
//		return null;
//	}
	

	@RequestMapping(value="bookmark.do") //북마크
	public Object bookmark()
	{
		//HttpSession session = request.getSession();
		int memberNo = 1; //(((Member)session.getAttribute("member")).getMemberNo());
		ArrayList<Bookmark> bookmark = personalService.selectBookmark(memberNo);
		ModelAndView view = new ModelAndView();
		if(bookmark!=null)
		{
			System.out.println(bookmark);
			view.addObject("bookmark", bookmark);
			view.setViewName("personal/bookmark");
			return view;
		}else {
			view.setViewName("personal/bookmark");
			return view;
		}
	}
	
	@RequestMapping(value="mypost.do")
	public Object mypost()
	{
		//HttpSession session = request.getSession();
		int memberNo =1;// (((Member)session.getAttribute("member")).getMemberNo());
		ArrayList<Mypost> mypost = personalService.selectMypost(memberNo);
		ModelAndView view = new ModelAndView();
		if(mypost!=null) { 
			System.out.println(mypost);
			view.addObject("mypost",mypost);
			view.setViewName("personal/myPost");
			return view;
		}else {
			view.setViewName("personal/myPost");
			return view;
	}
   }
	
	@RequestMapping(value="searchTitle.do") //내가쓴 글에서 제목검색
	@ResponseBody
	public Object searchTitle(HttpServletRequest request,@RequestParam String keyword)
	{
		Post p = new Post();
		p.setPostTitle(keyword); //
		p.setPostWriter(1);//session에서 회원번호 가져오기.
		System.out.println(keyword);
		ArrayList<Mypost> searchTitle = personalService.searchTitle(p);
		System.out.println(searchTitle);
		
		return keyword;
		
	}
	
	@RequestMapping(value="delBookmark.do") //북마크 제거.
	@ResponseBody
	public Object delBookmark(HttpServletRequest request,HttpServletResponse response) {
		Post p = new Post();
		p.setPostNo(Integer.parseInt(request.getParameter("delBookNo"))); //삭제하고자 하는 북마크의 게시글 번호
		p.setPostWriter(1);  //회원번호(로그인 되면 세션에서 회원번호 받을 예정)
		System.out.println(p.getPostNo());
		
		int delBookmark = personalService.delBookmark(p);
		return delBookmark;
	}
	
	 
}
