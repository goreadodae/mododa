package kr.pe.mododa.calendar.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.pe.mododa.calendar.model.service.CalendarService;
import kr.pe.mododa.calendar.model.service.CalendarServiceImpl;
import kr.pe.mododa.project.model.vo.Project;

@Controller("CalendarController")
public class CalendarControllerImpl implements CalendarController {

	@Autowired
	@Qualifier(value="CalendarService")
	private CalendarServiceImpl CalendarService;
	
	@Override
	@RequestMapping(value="/calendar.do")
	public String calendarView() {
		return "calendar/calendar";
	}

	@Override
	@RequestMapping(value="/IntroPopup.do")
	public String calendarIntroPopup() {
		return "calendar/schedulePlus";
	}

	@Override
	public Object selectProject() {
		 ArrayList<Project> list = CalendarService.projectSelectAll();
	      ModelAndView view = new ModelAndView();
	      if(list!=null) {
	         view.addObject("list",list);
	         view.setViewName("calendar/calendar");
	         return view;
	      } else {
	         view.setViewName("member/error");
	         return view;
	      }
	}
	
	


}
