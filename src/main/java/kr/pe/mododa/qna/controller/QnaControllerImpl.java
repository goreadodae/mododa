package kr.pe.mododa.qna.controller;

import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.pe.mododa.member.model.vo.Member;
import kr.pe.mododa.qna.model.service.QnaServiceImpl;
import kr.pe.mododa.qna.model.vo.Qna;
import kr.pe.mododa.qna.model.vo.qnaPage;

@Controller("qnaController")

public class QnaControllerImpl {

	@Autowired
	@Qualifier(value="qnaService")
	private QnaServiceImpl qnaService;
	
	@RequestMapping("/qnaList.do")
	public ModelAndView QuestionList(HttpServletRequest request,HttpSession session) {
	
		int currentPage;//현재 페이지 변수 선언
		if (request.getParameter("currentPage") == null) { //사용자가 처음 홈페이지들어갔을때 강제로 현재페이지를 1로 보냄 
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage")); // ex)3페이지를 눌렀을때 3페이지로 보냄
		}
		
		
		int memberNo = ((Member)session.getAttribute("member")).getMemberNo();
		
		qnaPage page = qnaService.selectAll(currentPage,memberNo);
		for(int i=0; i<page.getList().size(); i++) {
			Qna test = page.getList().get(i);
			System.out.println("que : " + test.getQueContents() + "ans : " + test.getAnsContents());
		}
		

		
//			ArrayList<Qna> qnaList = qnaService.qnaList(memberNo);
			
			ModelAndView view = new ModelAndView(); 
			view.addObject("qnaList",page.getList());//맵퍼에서 넘어온 "listNotice"을게시글이 불러올때 갯수를 view변수에 담는다
			view.addObject("qnaListCount",page.getPageCount()); // 총게시물수를 view변수에 담는다
			view.setViewName("qna/qnaList");// 게시글갯수,총게시물수를 noticeBoard.jsp로 보낸다
			return view;
			
		
	
	}
	@RequestMapping(value="/qnaWriteReady.do")
	public String qnaWriteReady() {
		return "qna/qnaWriteReady";
	}
	
	@RequestMapping(value="/qnaWrite.do")
	public ModelAndView qnaWrite(HttpServletRequest request) {
		String queTitle = request.getParameter("queTitle");
		 String queContents  = request.getParameter("queContents");
		 HttpSession session = request.getSession(false);
		 int memberNo = ((Member)session.getAttribute("member")).getMemberNo();
		 
			Qna qna = new Qna();
			qna.setQueTitle(queTitle);
			qna.setQueContents(queContents);
			qna.setMemberNo(memberNo);
		 
		 
		int result = qnaService.insertQuestion(qna);

		ModelAndView view = new ModelAndView();
		if(result>0) {
			view.setViewName("redirect:/qnaList.do");
		}else {
			view.setViewName("qna/qnaError");

		}
		return view;
	}
	
	
	
	
}