package kr.pe.mododa.project.model.service;

import kr.pe.mododa.project.model.vo.Project;
import kr.pe.mododa.project.model.vo.WorkOn;

public interface ProjectService {
	
	public int insertProject(Project project);
	public int insertWorkOn(WorkOn workOnInfo);

}
