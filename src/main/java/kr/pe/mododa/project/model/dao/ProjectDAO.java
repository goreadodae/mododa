package kr.pe.mododa.project.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import kr.pe.mododa.project.model.vo.Project;
import kr.pe.mododa.project.model.vo.WorkOn;

public interface ProjectDAO {
	
	public int insertProject(SqlSessionTemplate sqlSession, Project project);
	public int insertWorkOn(SqlSessionTemplate sqlSession, int proMemberNo);
	public int searchMemberNo(SqlSessionTemplate sqlSession, String memberId);
	public ArrayList<Project> searchProjectList(SqlSessionTemplate sqlSession, int memberNo);
	public int inviteMember(SqlSessionTemplate sqlSession, int memberNo);

}
