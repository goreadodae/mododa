package kr.pe.mododa.project.model.service;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.pe.mododa.project.model.dao.ProjectDAOImpl;
import kr.pe.mododa.project.model.vo.Project;
import kr.pe.mododa.project.model.vo.WorkOn;



@Service("projectService")
public class ProjectServiceImpl implements ProjectService {
	
	
	@Resource(name="projectDAO")
	private ProjectDAOImpl projectDAO;
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	@Override
	public int insertProject(Project project) {
		return projectDAO.insertProject(sqlSession, project);
	}

	@Override
	public int insertWorkOn(int proMemberNo) {
		return projectDAO.insertWorkOn(sqlSession, proMemberNo);
	}

}
