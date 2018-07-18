package kr.pe.mododa.post.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PostControllerImpl {

	@Autowired
	@RequestMapping(value="/testareum.do")
	public String calendarView () {
		return "post/test";
	}
	
}
