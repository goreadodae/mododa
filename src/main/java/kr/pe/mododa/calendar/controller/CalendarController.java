package kr.pe.mododa.calendar.controller;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface CalendarController {
	
	public String calendarView ();
	public String calendarIntroPopup();
	public void selectProject (HttpSession session,HttpServletResponse response) throws Exception;
	public void selectLinkPost (HttpServletResponse response,@RequestParam int postNo) throws Exception;
	public void calendarSchedule (HttpSession session,HttpServletResponse response) throws Exception;
	public ModelAndView calendarInsertSchedule(HttpSession session,HttpServletResponse response,@RequestParam int proSelect,@RequestParam int relationSelect,
			@RequestParam String title, @RequestParam Date startDate, @RequestParam Date endDate) throws Exception; 
	public void updateSchedule (HttpServletResponse response,@RequestParam int scheduleNo,@RequestParam String title,
			@RequestParam Date startDate,@RequestParam Date endDate) throws Exception;
	public ModelAndView infoSchedule (HttpServletResponse response,@RequestParam int scheduleNo) throws Exception;
	public void deleteSchdule (HttpServletResponse response,@RequestParam int scheduleNo)throws Exception;	
	public void selectDozenProject(HttpServletResponse response,@RequestParam(value = "checkboxValues[]") List<String> checkboxValues) throws Exception;
	
	
}
