package kr.pe.mododa.project.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import kr.pe.mododa.project.model.vo.Project;
import kr.pe.mododa.project.model.vo.WorkOn;

public interface ProjectDAO {
	
	public int insertProject(SqlSessionTemplate sqlSession, Project project);
	public int insertWorkOn(SqlSessionTemplate sqlSession, int proMNo);

}
