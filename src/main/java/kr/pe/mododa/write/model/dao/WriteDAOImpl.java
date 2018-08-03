package kr.pe.mododa.write.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.pe.mododa.post.model.vo.Post;
import kr.pe.mododa.project.model.vo.Project;
import kr.pe.mododa.write.model.vo.RelationSearchKey;
import kr.pe.mododa.write.model.vo.RelationWriting;
import kr.pe.mododa.write.model.vo.Upload;

@Repository("writeDAO")
public class WriteDAOImpl implements WriteDAO {

	public ArrayList<Project> autoComplete(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("write.forSerachProjectNames",memberNo);
	}

	public String currentProName(SqlSessionTemplate sqlSession, Project pj) {
		
		return sqlSession.selectOne("write.loadProjectName",pj);
	}

	public ArrayList<RelationWriting> relationWritingList(SqlSessionTemplate sqlSession, int currentProNo) {
		
		return (ArrayList)sqlSession.selectList("write.relationwritingList",currentProNo);
	}

	public ArrayList<RelationWriting> searchWriting(SqlSessionTemplate sqlSession, RelationSearchKey rsKey) {
		
		return (ArrayList)sqlSession.selectList("write.searchWriting",rsKey);
	}

	public ArrayList<Project> myProject(SqlSessionTemplate sqlSession, int memberNo) {
		
		return (ArrayList)sqlSession.selectList("write.myProject",memberNo);
	}

	public ArrayList<RelationWriting> loadByProName(SqlSessionTemplate sqlSession, RelationWriting rw) {
		
		return (ArrayList)sqlSession.selectList("write.loadByProName",rw);
	}

	public void insertFileUploaded(SqlSessionTemplate sqlSession, Upload vo) {
		sqlSession.insert("write.uploadFiles",vo);
		
		
				
	}
	
	

}
