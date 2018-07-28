package kr.pe.mododa.faq.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

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

import kr.pe.mododa.faq.model.service.FaqService;
import kr.pe.mododa.faq.model.service.FaqServiceImpl;
import kr.pe.mododa.faq.model.vo.Notice;
import kr.pe.mododa.faq.model.vo.Page;
import kr.pe.mododa.post.model.vo.Post;

@Controller("faqController")
public class FaqControllerImpl implements FaqController {

	@Autowired
	@Qualifier(value="faqService")
	private FaqServiceImpl faqService;


	@RequestMapping(value="/noticeList.do")
	public  ModelAndView noticeAll(HttpServletRequest request) {
		int currentPage;//현재 페이지 변수 선언
		if (request.getParameter("currentPage") == null) { //사용자가 처음 홈페이지들어갔을때 강제로 현재페이지를 1로 보냄 
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage")); // ex)3페이지를 눌렀을때 3페이지로 보냄
		}
		
		Page page = faqService.selectAll(currentPage);//페이지에 
	
		
		
		ModelAndView view = new ModelAndView(); 
		view.addObject("listNotice",page.getList());//맵퍼에서 넘어온 "listNotice"을게시글이 불러올때 갯수를 view변수에 담는다
		view.addObject("listCount",page.getPageCount()); // 총게시물수를 view변수에 담는다
		view.setViewName("faq/noticeBoard");// 게시글갯수,총게시물수를 noticeBoard.jsp로 보낸다
		return view;
		
	
		
	}
	
	@RequestMapping(value="/noticeDetail.do")
	public ModelAndView noticeDetail(HttpServletRequest request) {
		
				int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));

				int viewCount = faqService.viewCount(noticeNo);
				
				Notice nContent = faqService.selectNoticeOne(noticeNo);
		
				ModelAndView view = new ModelAndView(); 
				view.addObject("noticeDetail",nContent);
				view.setViewName("faq/noticeDetail");// 게시글갯수,총게시물수를 noticeBoard.jsp로 보낸다
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

		Page page = faqService.searchNotice(currentPage,search,searchOption);
		
		System.out.println(page.getList().get(0).getNoticeTitle());
		

		ModelAndView view = new ModelAndView(); 
		view.addObject("searchList",page.getList());//맵퍼에서 넘어온 "listNotice"을게시글 리스트를 view변수에 담는다
		view.addObject("searchCount",page.getPageCount()); // 총게시물수를 view변수에 담는다
		view.setViewName("faq/noticeSearch");// 게시글갯수,총게시물수를 noticeBoard.jsp로 보낸다
		return view;
		
		

	}
	@RequestMapping(value="/writeReady.do")
	public String writeReady() {
		return "faq/noticeWriteReady";
	}
	
//	@RequestMapping(value="/noticeWrite.do")
//	public ModelAndView noticeWrite(HttpServletRequest request) {
//		
//		HttpSession session = request.getSession(false);
//		
//		String noticeTitle = request.getParameter("title");
//		String noticeContents= request.getParameter("contents");
//
//		Notice notice = new Notice();
//		notice.setNoticeTitle(noticeTitle);
//		notice.setNoticeContents(noticeContents);
//		
//
//		// 3.비즈니스 로직 처리
//		int result = new BoardService().insertNotice(board);
//
//		if (result > 0) {// 글쓰기가 정상작동 할경우
//			response.sendRedirect("/review");
//		} else {// 작동이 안될경우
//			response.sendRedirect("/View/error/error.jsp");
//		}
//
//	} else {// 세션이 제대로 연결되지 않은경우
//		response.sendRedirect("/View/error/error.jsp");
//	}
//		
//		return null;
//		
//	}
		
		
		
}
