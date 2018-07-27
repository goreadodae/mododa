package kr.pe.mododa.write.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.pe.mododa.project.model.vo.Project;

@Repository("writeDAO")
public class WriteDAOImpl implements WriteDAO {

	public ArrayList<Project> autoComplete(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("write.loadProjectName",memberNo);
	}
	
	

}
