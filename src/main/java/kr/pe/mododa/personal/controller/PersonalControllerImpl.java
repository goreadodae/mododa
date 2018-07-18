package kr.pe.mododa.personal.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.pe.mododa.personal.model.service.PersonalServiceImpl;
import kr.pe.mododa.personal.model.vo.Newsfeed;

@Controller
public class PersonalControllerImpl implements PersonalController{
	
	@Autowired
	@Qualifier(value="personalService")
	private PersonalServiceImpl personalService;
	
	@RequestMapping(value="/newsfeed.do")
	public ModelAndView newsfeed() //속한 프로젝트의 모든 글을 가져옴..
	{
		ArrayList<Newsfeed> newsfeed = personalService.selectAllNewsFeed();
		return null;
	}
}
