package kr.pe.mododa.calendar.controller;

import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

public interface CalendarController {
	
	public String calendarView ();
	public String calendarIntroPopup();
	public Object selectProject ();
	public ModelAndView calendarSchedule (HttpServletRequest request,
			ModelMap modelMap,@ModelAttribute Calendar cl);

}
