package kr.pe.mododa.calendar.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.io.IOException;
import java.sql.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.synth.SynthSeparatorUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;

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
		return "calendar/calendarTemplateTest";
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
	
	/*@Override
	@RequestMapping(value="selectProjectOne.do")
	public void selectProjectOne(HttpServletResponse response,@RequestParam int proNo) throws Exception {
		
		Project p = CalendarService.selectProjectOne(proNo);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		 
		 new Gson().toJson(p,response.getWriter());
		
	}*/
	
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
		
		/*Date plusEndDate = (Date)(list.get(i).getEndDate())+1;*/
		endDate = sdf.format(list.get(i).getEndDate());
		list.get(i).setStEndDate(endDate); //끝 날짜를 format		
				/*System.out.println(list.get(i).getStEndDate());*/
		}
		
		
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		 
		 new Gson().toJson(list,response.getWriter());
	}

	@Override
	@RequestMapping(value="calendarInsertSchedule.do")
	public ModelAndView calendarInsertSchedule(HttpServletResponse response,@RequestParam int proSelect,@RequestParam int relationSelect,@RequestParam String title,
			@RequestParam Date startDate,@RequestParam Date endDate) throws Exception {
		
		Schedule sc = new Schedule();
		sc.setProNo(proSelect);
		sc.setPostNo(relationSelect);
		sc.setScTitle(title);
		sc.setStartDate(startDate);
		sc.setEndDate(endDate);		
		
		int result = CalendarService.calendarInsertSchedule(sc);		

		ModelAndView view = new ModelAndView();
		if(result>0) {
			view.addObject("result", result);
		}
		view.setViewName("jsonView");
		return view;
	}
	
	@Override
	@RequestMapping(value="updateSchedule.do")
	public void updateSchedule(HttpServletResponse response,@RequestParam int scheduleNo,@RequestParam String title,
			@RequestParam Date startDate,@RequestParam Date endDate) throws Exception {
	
		Schedule sc = new Schedule();
		
		sc.setScTitle(title);
		sc.setStartDate(startDate);
		sc.setEndDate(endDate);
		sc.setScheduleNo(scheduleNo);
		
		
		 int result = CalendarService.updateSchedule(sc);
		 
		 response.setContentType("application/json");
		 response.setCharacterEncoding("utf-8");
		 
		 new Gson().toJson(result,response.getWriter());
		 
	}
	
	@Override
	@RequestMapping(value="infoSchedule.do")
	public ModelAndView infoSchedule(HttpServletResponse response,@RequestParam int scheduleNo) throws Exception {
	
		Schedule sc = CalendarService.infoSchedule(scheduleNo);
		Project pj = CalendarService.selectProjectOne(scheduleNo);
		Post p = CalendarService.selectPostOne(scheduleNo);
		
		
		SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd", Locale.KOREA);
		
		String startDateUp =""; String endDateUp="";
		 
		startDateUp = sdf.format(sc.getStartDate());
		sc.setStStartDate(startDateUp); //시작 날짜를 format
		sc.setStartDate(null);
		endDateUp = sdf.format(sc.getEndDate());
		sc.setStEndDate(endDateUp); //끝 날짜를 format	
		sc.setEndDate(null);
		
		 
		 ModelAndView view = new ModelAndView();
			view.addObject("sc",sc);
			view.addObject("pj",pj);
			view.addObject("p",p);
			view.setViewName("jsonView");
			return view;
	}

	@Override
	@RequestMapping(value="deleteSchedule.do")
	public void deleteSchdule(HttpServletResponse response,@RequestParam int scheduleNo) throws Exception {
		
		 int result = CalendarService.deleteSchdule(scheduleNo);
		 
		 response.setContentType("application/json");
		 response.setCharacterEncoding("utf-8");
		 
		 new Gson().toJson(result,response.getWriter());
		
	}

	@Override
	@RequestMapping(value="selectDozenProject.do")
	public void selectDozenProject(HttpServletResponse response,@RequestParam(value = "checkboxValues[]") List<String> checkboxValues) throws Exception {

		ArrayList<Schedule> sclist = CalendarService.selectDozenProject(checkboxValues);
		 
		 response.setContentType("application/json");
		 response.setCharacterEncoding("utf-8");
		 
		 new Gson().toJson(sclist,response.getWriter());

		
	}


}
