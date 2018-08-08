package kr.pe.mododa.write.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

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

public interface WriteDAO {

	public String currentProName(SqlSessionTemplate sqlSession, Project pj);
	public ArrayList<RelationWriting> relationWritingList(SqlSessionTemplate sqlSession, int currentProNo);
	public ArrayList<RelationWriting> searchWriting(SqlSessionTemplate sqlSession, RelationSearchKey rsKey);
	public ArrayList<Project> myProject(SqlSessionTemplate sqlSession, int memberNo);
	public ArrayList<RelationWriting> loadByProName(SqlSessionTemplate sqlSession, RelationWriting rw);
	public int insertFileUploaded(SqlSessionTemplate sqlSession, Upload vo);
	public ArrayList<ProjectMember> projectMember(SqlSessionTemplate sqlSession, Project pj);
	public String myPicture(SqlSessionTemplate sqlSession, int memberNo);
	public PrivateSpace privateSpace(SqlSessionTemplate sqlSession, int memberNo);
	public ArrayList<Partners> myPartners(SqlSessionTemplate sqlSession, int memberNo);
	public int insertPostToProject(SqlSessionTemplate sqlSession, Post post);
	public int insertSchedules(SqlSessionTemplate sqlSession, Schedule schedule);
	public int insertRpPost(SqlSessionTemplate sqlSession, RelatedPost rpPost);
	public int insertCallMember(SqlSessionTemplate sqlSession, CallPost cp);
	public int setPrivateSpace(SqlSessionTemplate sqlSession, int memberNo);
	
	
	
	
	
	
	
	

}
