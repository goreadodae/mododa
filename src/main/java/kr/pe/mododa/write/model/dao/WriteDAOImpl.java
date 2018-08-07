package kr.pe.mododa.write.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.pe.mododa.calendar.model.vo.Schedule;
import kr.pe.mododa.library.model.vo.Upload;
import kr.pe.mododa.post.model.vo.Post;
import kr.pe.mododa.project.model.vo.Project;
import kr.pe.mododa.write.model.vo.CallPost;
import kr.pe.mododa.write.model.vo.Partners;
import kr.pe.mododa.write.model.vo.PrivateSpace;
import kr.pe.mododa.write.model.vo.ProjectMember;
import kr.pe.mododa.write.model.vo.RelatedPost;
import kr.pe.mododa.write.model.vo.RelationSearchKey;
import kr.pe.mododa.write.model.vo.RelationWriting;

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

	public int insertFileUploaded(SqlSessionTemplate sqlSession, Upload vo) {
		return sqlSession.insert("write.uploadFiles",vo);
		
		
				
	}

	public ArrayList<ProjectMember> projectMember(SqlSessionTemplate sqlSession, Project pj) {
		return (ArrayList)sqlSession.selectList("write.projectMember",pj);
		
	}

	public String myPicture(SqlSessionTemplate sqlSession, int memberNo) {
		
		return sqlSession.selectOne("write.myPicture", memberNo);
	}

	public PrivateSpace privateSpace(SqlSessionTemplate sqlSession, int memberNo) {
		
		return sqlSession.selectOne("write.privateSpace",memberNo);
	}

	public ArrayList<Partners> myPartners(SqlSessionTemplate sqlSession, int memberNo) {
		
		return (ArrayList)sqlSession.selectList("write.myPartner", memberNo);
	}

	public int insertPostToProject(SqlSessionTemplate sqlSession, Post post) {
		
		return sqlSession.insert("write.insertPostToProject",post);
	}

	public int insertSchedules(SqlSessionTemplate sqlSession, Schedule schedule) {
		
		return sqlSession.insert("write.insertSchedules",schedule);
	}

	public int insertRpPost(SqlSessionTemplate sqlSession, RelatedPost rpPost) {
		int result = sqlSession.insert("write.insertRpPost",rpPost);
		return result;
	}

	public int insertCallMember(SqlSessionTemplate sqlSession, CallPost cp) {
		int result = sqlSession.insert("write.insertCallMember",cp);
		return result;
	}

	public int setPrivateSpace(SqlSessionTemplate sqlSession, int memberNo) {
		
		return sqlSession.selectOne("write.setPrivateSpace",memberNo);
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
