package kr.pe.mododa.calendar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CalendarController {
	
	@Autowired
	@RequestMapping(value="/calendar.do")
	public String calendarView () {
		return "calendar/calendar";
	}
	
	@RequestMapping(value="/IntroPopup.do")
	public String calendarIntroPopup () {
		return "calendar/schedulePlus";
	}
	

}
