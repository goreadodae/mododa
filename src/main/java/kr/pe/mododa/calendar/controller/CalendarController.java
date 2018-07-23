package kr.pe.mododa.calendar.controller;

import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface CalendarController {
	
	public String calendarView ();
	public String calendarIntroPopup();
	public void selectProject (HttpServletResponse response) throws Exception;
	public void selectLinkPost (HttpServletResponse response,@RequestParam int postNo) throws Exception;
	public void calendarSchedule (HttpServletResponse response) throws Exception;

}
