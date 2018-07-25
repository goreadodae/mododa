package kr.pe.mododa.calendar.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.synth.SynthSeparatorUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		
		SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd", Locale.KOREA);
		
		String startDate =""; String endDate="";
		
		for(int i=0;i<list.size();i++) {
		
		startDate = sdf.format(list.get(i).getStartDate());
		list.get(i).setStStartDate(startDate); //시작 날짜를 format
		
		endDate = sdf.format(list.get(i).getEndDate());
		list.get(i).setStEndDate(endDate); //끝 날짜를 format
		
		}
		
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		 
		 new Gson().toJson(list,response.getWriter());
	}

	

	


	
	


}
