package kr.pe.mododa.faq.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
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
		int currentPage;
		if (request.getParameter("currentPage") == null) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		Page page = faqService.selectAll(currentPage);
	
		
		
		ModelAndView view = new ModelAndView();
		view.addObject("listNotice",page.getList());
		view.addObject("listCount",page.getPageCount());
		view.setViewName("faq/noticeBoard");
		return view;

	
	}
		
		
		
		
}
