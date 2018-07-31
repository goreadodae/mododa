package kr.pe.mododa.personal.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonIOException;

public interface PersonalController {
	public ModelAndView firstNewsfeed(HttpSession session);
	public ModelAndView newsfeed(HttpSession session);
	public ModelAndView bookmark(HttpSession session);
	public ModelAndView mypost(HttpSession session);
	public void searchTitle(HttpServletResponse response,HttpSession session,@RequestParam String keyword) throws Exception;
	public void searchBookmark(HttpServletResponse response,HttpSession session,@RequestParam String keyword) throws Exception;
	public void searchNews(HttpServletResponse response,HttpSession session,@RequestParam String keyword) throws Exception; 
}
