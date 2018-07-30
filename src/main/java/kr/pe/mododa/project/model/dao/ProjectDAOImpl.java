package kr.pe.mododa.project.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.pe.mododa.member.model.vo.Member;
import kr.pe.mododa.post.model.vo.Post;
import kr.pe.mododa.project.model.vo.Project;
import kr.pe.mododa.project.model.vo.ProjectPostList;
import kr.pe.mododa.project.model.vo.SearchHelper;



@Repository("projectDAO")
public class ProjectDAOImpl implements ProjectDAO {

	@Override
	public int insertProject(SqlSessionTemplate sqlSession, Project project) {
		return sqlSession.insert("project.insertProject", project);
	}

	@Override
	public int insertWorkOn(SqlSessionTemplate sqlSession, int proMemberNo) {
		return sqlSession.insert("project.insertWorkOn", proMemberNo);
	}

	@Override
	public int searchMemberNo(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.selectOne("project.searchMemberNo", memberId);
	}

	@Override
	public int insertInviteMember(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.insert("project.insertInviteMember", memberNo);
	}
	
	@Override
	public ArrayList<Project> searchProjectList(SqlSessionTemplate sqlSession, int memberNo) {
		List projectList = sqlSession.selectList("project.searchProjectList", memberNo);
		return (ArrayList<Project>)projectList;
	}
	
	@Override
	public Project searchPrivateList(SqlSessionTemplate sqlSession, int memberNo) {
		return (Project)sqlSession.selectOne("project.searchPrivateList", memberNo);
	}

	@Override
	public ArrayList<ProjectPostList> searchPostList(SqlSessionTemplate sqlSession, int proNo) {
		List postList = sqlSession.selectList("project.searchPostList", proNo);
		return (ArrayList<ProjectPostList>)postList;
	}

	@Override
	public ArrayList<ProjectPostList> searchMyPostList(SqlSessionTemplate sqlSession, Project project) {
		List postList = sqlSession.selectList("project.searchMyPostList", project);
		return (ArrayList<ProjectPostList>)postList;
	}

	public ArrayList<ProjectPostList> searchHashTagPostList(SqlSessionTemplate sqlSession, int proNo) {
		List postList = sqlSession.selectList("project.searchHashTagPostList", proNo);
		return (ArrayList<ProjectPostList>)postList;
	}

	public ArrayList<ProjectPostList> searchProTitleOrMemberName(SqlSessionTemplate sqlSession, SearchHelper sh) {
		List postList = sqlSession.selectList("project.searchProTitleOrMemberName", sh);
		return (ArrayList<ProjectPostList>)postList;
	}









}
