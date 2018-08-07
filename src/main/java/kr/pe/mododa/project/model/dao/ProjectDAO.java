package kr.pe.mododa.project.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import kr.pe.mododa.project.model.vo.ProgressHelper;
import kr.pe.mododa.project.model.vo.Project;
import kr.pe.mododa.project.model.vo.ProjectPostList;
import kr.pe.mododa.project.model.vo.SearchHelper;

public interface ProjectDAO {
	
	public int insertProject(SqlSessionTemplate sqlSession, Project project);
	public int insertWorkOn(SqlSessionTemplate sqlSession, int proMemberNo);
	public int searchMemberNo(SqlSessionTemplate sqlSession, String memberId);
	public int insertInviteMember(SqlSessionTemplate sqlSession, int memberNo);
	public ArrayList<Project> searchProjectList(SqlSessionTemplate sqlSession, int memberNo);
	public Project searchPrivateList(SqlSessionTemplate sqlSession, int memberNo);
	public ArrayList<ProjectPostList> searchPostList(SqlSessionTemplate sqlSession, int proNo);
	public ArrayList<ProjectPostList> searchMyPostList(SqlSessionTemplate sqlSession, Project project);
	public ArrayList<ProjectPostList> searchHashTagPostList(SqlSessionTemplate sqlSession, int proNo);
	public ArrayList<ProjectPostList> searchProTitleOrMemberName(SqlSessionTemplate sqlSession, SearchHelper sh);
	public ArrayList<ProjectPostList> searchHashTag(SqlSessionTemplate sqlSession, SearchHelper sh);
	public int updatePostProgress(SqlSessionTemplate sqlSession, ProgressHelper ph);
	public int updateProjectProgress(SqlSessionTemplate sqlSession, ProgressHelper ph);
	public String searchMoreProTitle(SqlSessionTemplate sqlSession, int proNo);
	public ArrayList<String> searchLeaderProNo(SqlSessionTemplate sqlSession, int memberNo);
	public int deleteProject(SqlSessionTemplate sqlSession, int proNo);
	public Project searchProjectInfo(SqlSessionTemplate sqlSession, int proNo);
	public int updateProjectDate(SqlSessionTemplate sqlSession, Project project);
}
