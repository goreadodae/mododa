package kr.pe.mododa.project.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.pe.mododa.member.model.vo.Member;
import kr.pe.mododa.post.model.vo.Post;
import kr.pe.mododa.project.model.vo.Project;



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
	public ArrayList<Project> searchProjectList(SqlSessionTemplate sqlSession, int memberNo) {
		List projectList = sqlSession.selectList("project.searchProjectList", memberNo);
		return (ArrayList<Project>)projectList;
	}

	@Override
	public int insertInviteMember(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.insert("project.insertInviteMember", memberNo);
	}

	@Override
	public ArrayList<Post> searchPostList(SqlSessionTemplate sqlSession, int proNo) {
		List proPostList = sqlSession.selectList("project.searchPostList", proNo);
		return (ArrayList<Post>)proPostList;
	}

	@Override
	public Project searchPrivateProject(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("project.searchPrivateProject", memberNo);
	}

	public Member searchMemberName(SqlSessionTemplate sqlSession, int proNo) {
		return sqlSession.selectOne("project.searchMemberName", proNo);
	}

	public String searchProTitle(SqlSessionTemplate sqlSession, int proNo) {
		return sqlSession.selectOne("project.searchProTitle", proNo);
	}

	public ArrayList<Member> postWriterMemberList(SqlSessionTemplate sqlSession, String[] postWriterNumberList) {
		List postWriterMemberList = sqlSession.selectList("project.postWriterMemberList", postWriterNumberList);
		return (ArrayList<Member>)postWriterMemberList;
	}

}
