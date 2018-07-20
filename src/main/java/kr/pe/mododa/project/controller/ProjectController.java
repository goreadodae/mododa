package kr.pe.mododa.project.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import kr.pe.mododa.project.model.vo.Project;

public interface ProjectController {
	
	public String gotoCreateProject();
	public String createProject(HttpSession session, Project project);
	public Object gotoInviteMember(HttpSession session);
	public String inviteMember(String memberId);
	
	public ArrayList<Project> projectList(HttpSession session);

}
