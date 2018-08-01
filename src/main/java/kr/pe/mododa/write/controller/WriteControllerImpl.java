package kr.pe.mododa.write.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;

import kr.pe.mododa.member.model.vo.Member;
import kr.pe.mododa.project.model.vo.Project;
import kr.pe.mododa.write.model.service.WriteServiceImpl;
import kr.pe.mododa.write.model.vo.RelationSearchKey;
import kr.pe.mododa.write.model.vo.RelationWriting;

@Controller
public class WriteControllerImpl implements WriteController {

	@Autowired
	private WriteServiceImpl writeService;

	@Autowired
	@RequestMapping(value = "/write.do")
	public String writeReady() {
		
		return "write/writePage";
	}

	@RequestMapping(value = "/testBtn.do")
	public String loadHeader() {
		return "write/testBtn";
	}

	@RequestMapping(value = "/loadTumbnail.do")
	public String loadTumbnail() {
		return "write/writePage";

	}

	@RequestMapping(value = "/projectNameList.do")
	public void autoComplete(HttpServletRequest request, HttpServletResponse response, @RequestParam int memberNo)
			throws Exception {
		Project pj = new Project();
		ModelAndView mav = new ModelAndView();

		ArrayList<Project> list = writeService.autoComplete(memberNo);
		response.setContentType("apllication/json");
		response.setCharacterEncoding("utf-8");

		new Gson().toJson(list, response.getWriter());

	}

	
	@RequestMapping(value ="/writePage.do")
	public ModelAndView currentProName(HttpServletResponse response, @RequestParam int currentProjectNo, HttpSession session) {
		Project pj = new Project();
		int memberNo = ((Member)session.getAttribute("member")).getMemberNo();
		pj.setProMemberNo(memberNo);
		pj.setProNo(currentProjectNo);
		
		
		String currentProName = writeService.currentProName(pj);

		ArrayList<Project> proList = writeService.myProject(memberNo);
		
		ModelAndView view = new ModelAndView();
		view.setViewName("/write/writePage");
		view.addObject("currentProName",currentProName);
		view.addObject("currentProNo",currentProjectNo);
		view.addObject("proList",proList);
		return view;
		

	}
	
	@RequestMapping(value="/relationWritingList.do")
	public void relationWritingList(HttpServletResponse response, @RequestParam int currentProNo) throws Exception{
		
		ArrayList<RelationWriting> list = writeService.relationWritingList(currentProNo);
		response.setContentType("aplication/json");
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(list,response.getWriter());
	}
	
	
	@RequestMapping(value="/searchWriting.do")
	public void searchWriting(HttpServletResponse response, @RequestParam String searchKeyword, @RequestParam int currentProNo) throws Exception{
		ModelAndView view = new ModelAndView();		
		RelationSearchKey rsKey = new RelationSearchKey();
		rsKey.setSearchKeyword(searchKeyword);
		rsKey.setCurrentProNo(currentProNo);	
		ArrayList<RelationWriting> searchProList = writeService.searchWriting(rsKey);
		response.setContentType("aplication/json");
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(searchProList,response.getWriter());
		
		
		
	}
	
	@RequestMapping(value="/loadByProName.do")
	public void loadByProName(HttpServletResponse response, @RequestParam int proNo, HttpSession session) throws JsonIOException, IOException {
		RelationWriting rw = new RelationWriting();
		rw.setPostWriter((((Member)session.getAttribute("member")).getMemberNo()));
		rw.setPostProNo(proNo);
		ArrayList<RelationWriting> list = writeService.loadByProName(rw);
		response.setContentType("aplication/json");
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(list,response.getWriter());
		
		
	}
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
