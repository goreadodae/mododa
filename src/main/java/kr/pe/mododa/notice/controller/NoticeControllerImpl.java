package kr.pe.mododa.notice.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.pe.mododa.notice.model.service.NoticeServiceImpl;
import kr.pe.mododa.notice.model.vo.Notice;
import kr.pe.mododa.notice.model.vo.Page;

@Controller("noticeController")
public class NoticeControllerImpl implements NoticeController {

	@Autowired
	@Qualifier(value="noticeService")
	private NoticeServiceImpl noticeService;


	@RequestMapping(value="/noticeList.do")
	public  ModelAndView noticeAll(HttpServletRequest request) {
		int currentPage;//현재 페이지 변수 선언
		if (request.getParameter("currentPage") == null) { //사용자가 처음 홈페이지들어갔을때 강제로 현재페이지를 1로 보냄 
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage")); // ex)3페이지를 눌렀을때 3페이지로 보냄
		}
		
		Page page = noticeService.selectAll(currentPage);//페이지에 
	
		
		
		ModelAndView view = new ModelAndView(); 
		view.addObject("listNotice",page.getList());//맵퍼에서 넘어온 "listNotice"을게시글이 불러올때 갯수를 view변수에 담는다
		view.addObject("listCount",page.getPageCount()); // 총게시물수를 view변수에 담는다
		view.setViewName("notice/noticeBoard");// 게시글갯수,총게시물수를 noticeBoard.jsp로 보낸다
		return view;
		
	
		
	}
	
	@RequestMapping(value="/noticeDetail.do")
	public ModelAndView noticeDetail(HttpServletRequest request) {
		
				int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));

				int viewCount = noticeService.viewCount(noticeNo);
				
				Notice nContent = noticeService.selectNoticeOne(noticeNo);
		
				ModelAndView view = new ModelAndView(); 
				view.addObject("noticeDetail",nContent);
				view.setViewName("notice/noticeDetail");// 게시글갯수,총게시물수를 noticeBoard.jsp로 보낸다
				return view;
				
	}
	
	@RequestMapping(value="/noticeSearch.do")
	public ModelAndView noticeSearch(HttpServletRequest request) {
	
		String search = request.getParameter("search");
		String searchOption = request.getParameter("searchOption");


		int currentPage;
		if(request.getParameter("currentPage")==null) {
			currentPage=1;
		}else{
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		Page page = noticeService.searchNotice(currentPage,search,searchOption);
		
		

		ModelAndView view = new ModelAndView(); 
		view.addObject("searchList",page.getList());//맵퍼에서 넘어온 "listNotice"을게시글 리스트를 view변수에 담는다
		view.addObject("searchCount",page.getPageCount()); // 총게시물수를 view변수에 담는다
		view.setViewName("notice/noticeSearch");// 게시글갯수,총게시물수를 noticeBoard.jsp로 보낸다
		return view;
		
		

	}
	@RequestMapping(value="/writeReady.do")
	public String writeReady() {
		return "notice/noticeWriteReady";
	}
	
	@RequestMapping(value="/noticeWrite.do")
	public ModelAndView noticeWrite(HttpServletRequest request) {
		
		HttpSession session = request.getSession(false);
		
		String noticeTitle = request.getParameter("title");
		String noticeContents= request.getParameter("contents");

		Notice notice = new Notice();
		notice.setNoticeTitle(noticeTitle);
		notice.setNoticeContents(noticeContents);
		
		
		// 3.비즈니스 로직 처리
		int result = noticeService.insertNotice(notice);
		
		ModelAndView view = new ModelAndView();
		if(result>0) {
		 
		view.setViewName("redirect:/noticeList.do");
		}else {
		view.setViewName("notice/noticeError");
		
		}
		return view;
	}
	
	@RequestMapping(value="/noticeDelete.do")
	public ModelAndView noticeDelete(HttpServletRequest request) {
		
		//1.view에서 요청값 받기
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		
		//2.비즈니스 로직
		
		HttpSession session = request.getSession(false); 
		
		int result = noticeService.deleteNotice(noticeNo); // 게시글 삭제
		
		 ModelAndView view = new ModelAndView();
				
				if(result>0) { //게시글삭제가 성공하면
					view.setViewName("redirect:/noticeList.do");
				}else {//게시글 삭제가 실패하면
					view.setViewName("notice/noticeError");
					
				}
			
			
		
		return view;
		
	}
		
	
	@RequestMapping(value="/noticeUpdateReady.do")
	public ModelAndView noticeUpdateReady(HttpServletRequest request) {
	

		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		
		HttpSession session = request.getSession(false);

		
		Notice notice = noticeService.noticeUpdateReady(noticeNo);
		
		
		ModelAndView view = new ModelAndView(); 
		view.addObject("noticeUpdateReady",notice);
		view.setViewName("notice/noticeUpdateReady");
		return view;
			
	}
	

	@RequestMapping(value="/noticeUpdate.do")
	public ModelAndView noticeUpdate(HttpServletRequest request) {
		
		int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
		String noticeTitle = request.getParameter("noticeTitle");
		String noticeContents = request.getParameter("noticeContents");
		
		System.out.println(noticeNo);
		
		Notice notice = new Notice();
		notice.setNoticeNo(noticeNo);
		notice.setNoticeTitle(noticeTitle);
		notice.setNoticeContents(noticeContents);
		
		HttpSession session=request.getSession(false);
		

			int result = noticeService.updateNotice(notice);
			
			System.out.println(result);
			
			ModelAndView view = new ModelAndView();

			if(result>0) { //게시글수정이 성공하면
				view.setViewName("redirect:/noticeDetail.do");
				}else {//게시글 수정이 실패하면
				view.setViewName("notice/noticeError");
					
				}
				return view;
		
	}
	
	
}
