package kr.pe.mododa.write.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;

import kr.pe.mododa.calendar.model.vo.Schedule;
import kr.pe.mododa.library.model.vo.Upload;
import kr.pe.mododa.member.model.vo.Member;
import kr.pe.mododa.post.model.vo.Post;
import kr.pe.mododa.project.model.vo.Project;
import kr.pe.mododa.write.model.service.WriteServiceImpl;
import kr.pe.mododa.write.model.vo.CallPost;
import kr.pe.mododa.write.model.vo.Partners;
import kr.pe.mododa.write.model.vo.PrivateSpace;
import kr.pe.mododa.write.model.vo.ProjectMember;
import kr.pe.mododa.write.model.vo.RelatedPost;
import kr.pe.mododa.write.model.vo.RelationSearchKey;
import kr.pe.mododa.write.model.vo.RelationWriting;

public interface WriteController {
	
	public String writeReady();
	public ModelAndView setPrivateSpace(HttpSession session); 
	public ModelAndView currentProName(HttpServletResponse response, @RequestParam int currentProjectNo, HttpSession session);
	public void relationWritingList(HttpServletResponse response, @RequestParam int currentProNo) throws Exception;
	public void searchWriting(HttpServletResponse response, @RequestParam String searchKeyword, @RequestParam int currentProNo) throws Exception;
	public void loadByProName(HttpServletResponse response, @RequestParam int proNo, HttpSession session) throws JsonIOException, IOException;
	public String insertPost(HttpServletRequest request,@RequestParam int currentProNo, 
			@RequestParam(value="writeTitle",required=true) String writeTitle, 
			@RequestParam(value="inputContents",required=true) String inputContents,
			@RequestParam(value="hashResults",required=false) String[] hashResults,
			@RequestParam(value="startDate",required=false) Date[] startDate,
			@RequestParam(value="endDate",required=false) Date[] endDate,
			@RequestParam(value="scheTitle",required=false) String[] scheTitle,
			@RequestParam(value="rpPostNo", required=false) int[] rpPostNo,
			@RequestParam(value="rpPostProNo", required=false) int[] rpPostProNo,
			@RequestParam(value="calledPartner", required=false) int[] calledPartner,
			@RequestParam(value="files", required=false)MultipartFile[] files, HttpSession session ); 
		
	public ModelAndView convertProName(HttpServletResponse response, @RequestParam int proNo, HttpSession session) throws JsonIOException, IOException;
	public ModelAndView myPartners(HttpSession session,@RequestParam int privateNo); 

	

}
