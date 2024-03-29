package kr.pe.mododa.project.model.service;

import java.util.ArrayList;

import kr.pe.mododa.project.model.vo.ProgressHelper;
import kr.pe.mododa.project.model.vo.Project;
import kr.pe.mododa.project.model.vo.ProjectPostList;
import kr.pe.mododa.project.model.vo.SearchHelper;

public interface ProjectService {
	
	public int insertProject(Project project);
	public int insertWorkOn(int proMemberNo);
	public int searchMemberNo(String memberId);
	public int insertInviteMember(int memberNo);
	public ArrayList<Project> searchProjectList(int memberNo);
	public Project searchPrivateList(int memberNo);
	public ArrayList<ProjectPostList> searchPostList(int proNo);
	public ArrayList<ProjectPostList> searchMyPostList(Project project);
	public ArrayList<ProjectPostList> searchHashTagPostList(int proNo);
	public ArrayList<ProjectPostList> searchProTitleOrMemberName(SearchHelper sh);
	public ArrayList<ProjectPostList> searchHashTag(SearchHelper sh);
	public int updatePostProgress(ProgressHelper ph);
	public int updateProjectProgress(ProgressHelper ph);
	public String searchMoreProTitle(int proNo);
	public ArrayList<String> searchLeaderProNo(int memberNo);
	public int deleteProject(int proNo);
	public Project searchProjectInfo(int proNo);
	public int updateProjectDate(Project project);
	
	
	
}
