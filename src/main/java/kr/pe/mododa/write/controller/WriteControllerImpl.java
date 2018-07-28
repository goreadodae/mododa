package kr.pe.mododa.write.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;

import kr.pe.mododa.project.model.vo.Project;
import kr.pe.mododa.write.model.service.WriteServiceImpl;

@Controller
public class WriteControllerImpl implements WriteController {
	
		@Autowired
		private WriteServiceImpl writeService;
		

		@Autowired
		@RequestMapping(value="/write.do")
		public String writeReady() {
			return "write/writePage";
		}
		
		@RequestMapping(value="/testBtn.do")
		public String loadHeader() {
			return "write/testBtn";
		}
		
		
		@RequestMapping(value="/loadTumbnail.do")
		public String loadTumbnail() {
			return "write/writePage";
			
		}
		
		@RequestMapping(value="/autoComplete.do")
		public void autoComplete(HttpServletRequest request,HttpServletResponse response, @RequestParam int memberNo) throws Exception {
		Project pj = new Project();
		ModelAndView mav = new ModelAndView();
		
		ArrayList<Project> list = writeService.autoComplete(memberNo);
		response.setContentType("apllication/json");
		response.setCharacterEncoding("utf-8");
		
		new Gson().toJson(list,response.getWriter());	
		}
		
}
		



