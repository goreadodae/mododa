package kr.pe.mododa.personal.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;

import kr.pe.mododa.member.model.vo.Member;
import kr.pe.mododa.personal.model.service.PersonalServiceImpl;
import kr.pe.mododa.personal.model.vo.Bookmark;
import kr.pe.mododa.personal.model.vo.Mypost;
import kr.pe.mododa.personal.model.vo.Newsfeed;
import kr.pe.mododa.personal.model.vo.SerDelPost;
import kr.pe.mododa.post.model.vo.Post;

@Controller
public class PersonalControllerImpl implements PersonalController{
	
	@Autowired
	@Qualifier(value="personalService")
	private PersonalServiceImpl personalService;
	
	@RequestMapping(value="newsfeed.do") //뉴스피드....
	@Override
	public ModelAndView newsfeed(HttpSession session) //속한 프로젝트의 모든 글을 가져옴..
	{
		int memberNo = ((Member)session.getAttribute("member")).getMemberNo(); //세션에서 회원번호 추출
		ArrayList<Newsfeed> newsfeed = personalService.selectAllNewsFeed(memberNo);
		System.out.println(newsfeed);
		ModelAndView view = new ModelAndView();
		view.addObject("newsfeed",newsfeed);
		view.setViewName("personal/newsfeed");
		return view;
	}
	

	@RequestMapping(value="bookmark.do") //북마크
	@Override
	public ModelAndView bookmark(HttpSession session)
	{
		int memberNo = ((Member)session.getAttribute("member")).getMemberNo();
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
	@Override
	public ModelAndView mypost(HttpSession session)
	{
		int memberNo =((Member)session.getAttribute("member")).getMemberNo();
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
	@RequestMapping(value="searchNews.do")//뉴스피드 검색
	@ResponseBody
	@Override
	public void searchNews(HttpServletResponse response,HttpSession session,@RequestParam String keyword) throws Exception
	{
		SerDelPost sdp = new SerDelPost();
		sdp.setKeyword(keyword);
		sdp.setMemberNo(((Member)session.getAttribute("member")).getMemberNo());
		ArrayList<Newsfeed> searchFeed = personalService.searchNews(sdp);
		System.out.println(searchFeed);
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(searchFeed,response.getWriter());
	}
	
	@RequestMapping(value="searchTitle.do") //내가쓴 글에서 제목검색
	@ResponseBody
	@Override
	public void searchTitle(HttpServletResponse response,HttpSession session,@RequestParam String keyword) throws Exception
	{
		Post p = new Post();
		p.setPostTitle(keyword); //
		p.setPostWriter(((Member)session.getAttribute("member")).getMemberNo());//session에서 회원번호 가져오기.
		System.out.println(keyword);
		ArrayList<Mypost> searchTitle = personalService.searchTitle(p);
		System.out.println(searchTitle);
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(searchTitle,response.getWriter());
	}
	
	@RequestMapping(value="delBookmark.do") //북마크 제거.
	@ResponseBody
	public Object delBookmark(HttpServletRequest request,HttpSession session, HttpServletResponse response) {
		Post p = new Post();
		p.setPostNo(Integer.parseInt(request.getParameter("delBookNo"))); //삭제하고자 하는 북마크의 게시글 번호
		p.setPostWriter(((Member)session.getAttribute("member")).getMemberNo());  //회원번호(로그인 되면 세션에서 회원번호 받을 예정)
		System.out.println(p.getPostNo());
		int delBookmark = personalService.delBookmark(p);
		return delBookmark;
	}
	
	@RequestMapping(value="searchBook.do") //북마크에서 검색어를 입력받아 검색.
	@ResponseBody
	@Override
	public void searchBookmark(HttpServletResponse response,HttpSession session,@RequestParam String keyword) throws Exception
	{
		SerDelPost sdp = new SerDelPost();
		sdp.setKeyword(keyword);
		sdp.setMemberNo(((Member)session.getAttribute("member")).getMemberNo());//로그인되면 세션에서 회원번호 가져오기.
		System.out.println(keyword);
		ArrayList<Bookmark> searchBook = personalService.searchBookmark(sdp);

		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(searchBook,response.getWriter());
	}
	
	

}
