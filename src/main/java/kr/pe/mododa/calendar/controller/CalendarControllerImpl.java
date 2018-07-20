package kr.pe.mododa.calendar.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.TimeZone;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	@RequestMapping(value="calendar.do")
	public String calendarView() {
		return "calendar/calendar";
	}

	@Override
	@RequestMapping(value="/IntroPopup.do")
	public String calendarIntroPopup() {
		return "calendar/schedulePlus";
	}

	@Override
	@RequestMapping(value="/selectProject.do")
	public Object selectProject() {
		 ArrayList<Project> list = CalendarService.projectSelectAll();
	
	      ModelAndView view = new ModelAndView();
	
	         view.addObject("list",list);
	         view.setViewName("calendar/calendar");
	         return view;
	      
	}

	@Override
	@RequestMapping(value="/calendarSchedule.do")
	public ModelAndView calendarSchedule(HttpServletRequest request, ModelMap modelMap,@ModelAttribute Calendar cl) {
		
		HashMap resultMap = new HashMap();
		ModelAndView mav = new ModelAndView();
		//Calendar result = CalendarService.calendarSchedule(cl);
		Calendar c = Calendar.getInstance(TimeZone.getTimeZone("Asia/Seoul"));
		
			//if(result!=null) {
				//resultMap.put("scheduleNo", result.get);
			//}
		
		return null;
	}

	


	
	


}
