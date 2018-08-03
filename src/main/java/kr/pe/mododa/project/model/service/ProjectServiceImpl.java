package kr.pe.mododa.project.model.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.pe.mododa.project.model.dao.ProjectDAOImpl;
import kr.pe.mododa.project.model.vo.Project;
import kr.pe.mododa.project.model.vo.ProjectPostList;
import kr.pe.mododa.project.model.vo.SearchHelper;
import kr.pe.mododa.project.model.vo.SearchMember;
import kr.pe.mododa.project.model.vo.WorkOn;
import kr.pe.mododa.project.model.vo.WorkOnMember;
import kr.pe.mododa.project.model.vo.WorkOnProject;



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

	public String inviteMemberAtHeader(int proNo, String inviteMemberId) {
		String result="";
		int inviteMemberNo = projectDAO.searchMemberNo(sqlSession, inviteMemberId);
		if(inviteMemberNo>0) {
			WorkOn wo = new WorkOn();
			wo.setProNo(proNo);
			wo.setMemberNo(inviteMemberNo);
			if(projectDAO.checkMemberNoInWorkOn(sqlSession, wo)) {
				result = "having";
			} else {
				int inviteRes = projectDAO.inviteMemberAtHeader(sqlSession, wo);
				if(inviteRes>0) {
					result = "success";
				}
				else {
					result = "failed";
				}
			}
		} else {
			result = "nothing";
		}
		return result;
	}

	public ArrayList<WorkOnMember> selectMemberList(int proNo) {
		return projectDAO.selectMemberList(sqlSession, proNo);
	}

	public int inviteProMemberCancel(int memberNo, int proNo) {
		WorkOnMember wom = new WorkOnMember();
		wom.setMemberNo(memberNo);
		wom.setProNo(proNo);
		return projectDAO.inviteProMemberCancel(sqlSession, wom);
	}

	public ArrayList<WorkOnProject> selectInvitingMemberList(int memberNo) {
		return projectDAO.selectInvitingMemberList(sqlSession, memberNo);
	}

	public int acceptMember(int memberNo, int proNo) {
		WorkOnMember wom = new WorkOnMember();
		wom.setMemberNo(memberNo);
		wom.setProNo(proNo);
		wom.setInviteYN('Y');
		return projectDAO.acceptMember(sqlSession, wom);
	}

	public int checkLeader(int proNo) {
		return projectDAO.checkLeader(sqlSession, proNo);
	}

	public ArrayList<WorkOnMember> searchProMember(int proNo, String searchMemberText) {
		SearchMember sm = new SearchMember();
		sm.setProNo(proNo);
		sm.setSearchMemberText(searchMemberText);
		System.out.println(sm);
		return projectDAO.searchProMember(sqlSession, sm);
	}

}
