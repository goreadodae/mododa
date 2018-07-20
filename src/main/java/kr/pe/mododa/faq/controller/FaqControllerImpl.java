package kr.pe.mododa.faq.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
			return view;
		}else {
			view.setViewName("faq/error");
		}
		return view;
	}

}
