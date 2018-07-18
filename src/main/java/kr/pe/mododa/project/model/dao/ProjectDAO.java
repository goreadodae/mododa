package kr.pe.mododa.project.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import kr.pe.mododa.project.model.vo.Project;

public interface ProjectDAO {
	
	public int insertProject(SqlSessionTemplate sqlSession, Project project);

}
