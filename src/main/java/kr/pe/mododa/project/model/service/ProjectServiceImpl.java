package kr.pe.mododa.project.model.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.pe.mododa.member.model.vo.Member;
import kr.pe.mododa.post.model.vo.Post;
import kr.pe.mododa.project.model.dao.ProjectDAOImpl;
import kr.pe.mododa.project.model.vo.Project;
import kr.pe.mododa.project.model.vo.ProjectPostList;
import kr.pe.mododa.project.model.vo.SearchHelper;
import kr.pe.mododa.project.model.vo.WorkOn;



@Service("projectService")
public class ProjectServiceImpl implements ProjectService {
	
	
	@Resource(name="projectDAO")
	private ProjectDAOImpl projectDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	@Override
	public int insertProject(Project project) {
		return projectDAO.insertProject(sqlSession, project);
	}

	@Override
	public int insertWorkOn(int proMemberNo) {
		return projectDAO.insertWorkOn(sqlSession, proMemberNo);
	}

	@Override
	public int searchMemberNo(String memberId) { // 회원 번호 검색
		return projectDAO.searchMemberNo(sqlSession, memberId);
	}
	
	@Override
	public int insertInviteMember(int memberNo) {
		return projectDAO.insertInviteMember(sqlSession, memberNo);
	}

	@Override
	public ArrayList<Project> searchProjectList(int memberNo) {
		return projectDAO.searchProjectList(sqlSession, memberNo);
	}
	
	@Override
	public Project searchPrivateList(int memberNo) {
		return projectDAO.searchPrivateList(sqlSession, memberNo);
	}

	@Override
	public ArrayList<ProjectPostList> searchPostList(int proNo) {
		return projectDAO.searchPostList(sqlSession, proNo);
	}

	@Override
	public ArrayList<ProjectPostList> searchMyPostList(Project project) {
		return projectDAO.searchMyPostList(sqlSession, project);
	}

	@Override
	public ArrayList<ProjectPostList> searchHashTagPostList(int proNo) {
		return projectDAO.searchHashTagPostList(sqlSession, proNo);
	}

	@Override
	public ArrayList<ProjectPostList> searchProTitleOrMemberName(SearchHelper sh) {
		return projectDAO.searchProTitleOrMemberName(sqlSession, sh);
	}

	@Override
	public ArrayList<ProjectPostList> searchHashTag(SearchHelper sh) {
		return projectDAO.searchHashTag(sqlSession, sh);
	}








}
