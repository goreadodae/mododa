package kr.pe.mododa.project.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.pe.mododa.project.model.vo.Project;



@Repository("projectDAO")
public class ProjectDAOImpl implements ProjectDAO {

	@Override
	public int insertProject(SqlSessionTemplate sqlSession, Project project) {
		return sqlSession.insert("project.insertProject", project);
	}

}
