package kr.pe.mododa.faq.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.pe.mododa.faq.model.service.FaqService;
import kr.pe.mododa.faq.model.vo.Notice;

@Controller("faqController")
public class FaqControllerImpl implements FaqController {

	@Autowired
	@Qualifier(value="faqService")
	private FaqService faqService;

	@Override
	@RequestMapping(value="/noticeList.do")
	public Object selectNotice() {
		ArrayList<Notice> nlist = faqService.noticeAll();
		ModelAndView view = new ModelAndView();
		if(nlist != null) {
			view.addObject("nlist",nlist);
			view.setViewName("faq/noticeBoard");
			System.out.println(view);
			return view;
		}else {
			view.setViewName("faq/error");
		}
		return view;
	}


	@RequestMapping(value="/noticeRead.do")
	public ModelAndView noticeView(@RequestParam int noticeNo) {
		Notice readPage = faqService.noticeRead(noticeNo);
		ModelAndView view = new ModelAndView();
		if(readPage != null) {
		view.addObject("readPage",readPage);
		view.setViewName("faq/noticeRead");
		System.out.println(readPage);
		return view;
		}else {
			view.setViewName("faq/error");
		}
		return view;
	}
}
