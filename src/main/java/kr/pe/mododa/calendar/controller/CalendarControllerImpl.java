package kr.pe.mododa.calendar.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.TimeZone;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import kr.pe.mododa.calendar.model.service.CalendarServiceImpl;
import kr.pe.mododa.calendar.model.vo.Schedule;
import kr.pe.mododa.post.model.vo.Post;
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
	@RequestMapping(value="IntroPopup.do")
	public String calendarIntroPopup() {
		return "calendar/schedulePlus";
	}

	@Override
	@RequestMapping(value="selectProject.do")
	public void selectProject(HttpServletResponse response) throws Exception {
		 ArrayList<Project> list = CalendarService.projectSelectAll();
		 
		 response.setContentType("application/json");
		 response.setCharacterEncoding("utf-8");
		 
		 new Gson().toJson(list,response.getWriter());
		 
	}
	
	@Override
	@RequestMapping(value="selectLinkPost.do")
	public void selectLinkPost(HttpServletResponse response,@RequestParam int postProNo) throws Exception {
	
		 ArrayList<Post> linkPostList = CalendarService.postSelectAll(postProNo);
		 
		 response.setContentType("application/json");
		 response.setCharacterEncoding("utf-8");
		 
		 new Gson().toJson(linkPostList,response.getWriter());
		 
	}

	@Override
	@RequestMapping(value="calendarSchedule.do")
	public void calendarSchedule(HttpServletResponse response) throws Exception {
		
		ArrayList<Schedule> list = CalendarService.calendarSchedule();
		
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		 
		 new Gson().toJson(list,response.getWriter());
	}

	

	


	
	


}
