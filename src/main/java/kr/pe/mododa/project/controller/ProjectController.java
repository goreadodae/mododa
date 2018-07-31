package kr.pe.mododa.project.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestParam;

import kr.pe.mododa.project.model.vo.Project;

public interface ProjectController {
	
	
	// 프로젝트 생성
	public String gotoCreateProject();
	public String createProject(HttpSession session, Project project);
	public String gotoInviteMember(HttpSession session);
	public String inviteMember(String memberId);
	public Object checkInvite(String memberId);
	
	
	// 프로젝트 목록 읽어오기
	public ArrayList<Project> projectList(HttpSession session);
	public Project privateList(HttpSession session);
	
	
	// 프로젝트 글 읽어오기
	public Object projectPost(int proNo);
	public Object privatePost(int proNo);
	public Object projectMyPost(HttpSession session, int proNo);
	public Object projectHashTag(int proNo);
	public Object privateHashTag(int proNo);
	
	
	
	// 검색
	public Object searchProTitleOrMemberName(String keyword, int proNo, String projectValue);
	public Object searchMyPostProTitle(HttpSession session, String keyword, int proNo);
	public Object searchHashTag(String keyword, int proNo);
	
	
	// 프로젝트 진행 현황
	public Object projectProgress(int proNo);
}
