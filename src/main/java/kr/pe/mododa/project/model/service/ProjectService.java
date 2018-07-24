package kr.pe.mododa.project.model.service;

import java.util.ArrayList;

import kr.pe.mododa.project.model.vo.Project;
import kr.pe.mododa.project.model.vo.WorkOn;

public interface ProjectService {
	
	public int insertProject(Project project);
	public int insertWorkOn(int proMemberNo);
	
	public int searchMemberNo(String memberId);
	public ArrayList<Project> searchProjectList(int memberNo);
	
	public int inviteMember(int memberNo);
	

}
