package kr.pe.mododa.project.controller;

import javax.servlet.http.HttpSession;

import kr.pe.mododa.project.model.vo.Project;

public interface ProjectController {
	
	public String gotoProTitle();
	public String createProject(HttpSession session, Project project);
	public String gotoInviteMember();

}
