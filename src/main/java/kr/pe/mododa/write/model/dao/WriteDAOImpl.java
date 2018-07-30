package kr.pe.mododa.write.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.pe.mododa.post.model.vo.Post;
import kr.pe.mododa.project.model.vo.Project;

@Repository("writeDAO")
public class WriteDAOImpl implements WriteDAO {

	public ArrayList<Project> autoComplete(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("write.forSerachProjectNames",memberNo);
	}

	public String currentProName(SqlSessionTemplate sqlSession, Project pj) {
		
		return sqlSession.selectOne("write.loadProjectName",pj);
	}

	public ArrayList<Post> relationWriteList(SqlSessionTemplate sqlSession, int currentProNo) {
		
		return (ArrayList)sqlSession.selectList("write.relationwriteList",currentProNo);
	}
	
	

}
