package kr.pe.mododa.calendar.controller;

import java.sql.Date;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface CalendarController {
	
	public String calendarView ();
	public String calendarIntroPopup();
	public void selectProject (HttpServletResponse response) throws Exception;
	public void selectLinkPost (HttpServletResponse response,@RequestParam int postNo) throws Exception;
	public void calendarSchedule (HttpServletResponse response) throws Exception;
	public ModelAndView calendarInsertSchedule(HttpServletResponse response,@RequestParam int proSelect,@RequestParam int relationSelect,
			@RequestParam String title, @RequestParam Date startDate, @RequestParam Date endDate) throws Exception; 
	public void updateSchedule (HttpServletResponse response,@RequestParam int scheduleNo,@RequestParam String title,
			@RequestParam Date startDate,@RequestParam Date endDate) throws Exception;
	public void infoSchedule (HttpServletResponse response,@RequestParam int scheduleNo) throws Exception;
	public void deleteSchdule (HttpServletResponse response,@RequestParam int scheduleNo)throws Exception;	
	public void selectProjectOne (HttpServletResponse response,@RequestParam int proNo) throws Exception;
	
	
}
