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

@Controller("qnaController")

public class QnaControllerImpl {

	@Autowired
	@Qualifier(value="qnaService")
	private QnaServiceImpl qnaService;
	
	@RequestMapping("/qnaList.do")
	public ModelAndView QuestionList(HttpServletRequest request,HttpSession session) {
	
		
		int memberNo = ((Member)session.getAttribute("member")).getMemberNo();
		
			ArrayList<Qna> qnaList = qnaService.qnaList(memberNo);
			
			ModelAndView view  = new ModelAndView();
			view.addObject("qnaList",qnaList);
			view.setViewName("qna/qnaList");
			return view;
			

			

		
	
}
}