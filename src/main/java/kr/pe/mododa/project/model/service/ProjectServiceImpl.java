package kr.pe.mododa.project.model.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.pe.mododa.post.model.vo.Post;
import kr.pe.mododa.project.model.dao.ProjectDAOImpl;
import kr.pe.mododa.project.model.vo.Project;
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
	public int searchMemberNo(String memberId) {
		return projectDAO.searchMemberNo(sqlSession, memberId);
	}

	@Override
	public ArrayList<Project> searchProjectList(int memberNo) {
		return projectDAO.searchProjectList(sqlSession, memberNo);
	}

	@Override
	public int insertInviteMember(int memberNo) {
		return projectDAO.insertInviteMember(sqlSession, memberNo);
	}

	@Override
	public ArrayList<Post> searchProPostList(int proNo) {
		return projectDAO.searchProPostList(sqlSession, proNo);
	}

}
