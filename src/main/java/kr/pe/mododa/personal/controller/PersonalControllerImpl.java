package kr.pe.mododa.personal.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.pe.mododa.personal.model.service.PersonalServiceImpl;
import kr.pe.mododa.personal.model.vo.Bookmark;
import kr.pe.mododa.personal.model.vo.Mypost;

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
	
	@RequestMapping(value="searchTitle.do")
	public Object searchTitle(HttpServletRequest request,HttpServletResponse response)
	{
		String searchTitle = request.getParameter("keyword");
		return null;
		
	}
}
