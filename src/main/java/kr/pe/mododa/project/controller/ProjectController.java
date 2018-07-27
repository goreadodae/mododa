package kr.pe.mododa.project.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestParam;

import kr.pe.mododa.project.model.vo.Project;

public interface ProjectController {
	
	public String gotoCreateProject();
	public String createProject(HttpSession session, Project project);
	public Object gotoInviteMember(HttpSession session);
	public String inviteMember(String memberId);
	public ArrayList<Project> projectList(HttpSession session);	
	public Object proPost(int proNo);
	public Project privateProject(HttpSession session);
	public Object priPost(int proNo);
}
