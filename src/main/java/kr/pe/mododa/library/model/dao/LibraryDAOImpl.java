package kr.pe.mododa.library.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.pe.mododa.library.model.vo.Link;
import kr.pe.mododa.library.model.vo.Todo;
import kr.pe.mododa.library.model.vo.Upload;
import kr.pe.mododa.member.model.vo.Member;
import kr.pe.mododa.project.model.vo.Project;

@Repository("libraryDAO")
public class LibraryDAOImpl implements LibraryDAO{

	// 전체 할 일 출력
	public ArrayList<Todo> listTodo(SqlSessionTemplate sqlSession, int memberNo) {
		List listTodo = sqlSession.selectList("library.listTodo", memberNo);
		return (ArrayList<Todo>)listTodo;
	}

	// 전체 의사결정 출력
	public ArrayList<Todo> listDecision(SqlSessionTemplate sqlSession, int memberNo) {
		List listDecision = sqlSession.selectList("library.listDecision", memberNo);
		return (ArrayList<Todo>)listDecision;
	}

	public ArrayList<Project> listProject(SqlSessionTemplate sqlSession, int memberNo) {
		List listProject = sqlSession.selectList("library.listProject", memberNo);
		return (ArrayList<Project>)listProject;
	}

	public ArrayList<Upload> listImage(SqlSessionTemplate sqlSession, int memberNo) {
		List listImage = sqlSession.selectList("library.listImage", memberNo);
		return (ArrayList<Upload>)listImage;
	}

	public ArrayList<Upload> listFile(SqlSessionTemplate sqlSession, int memberNo) {
		List listFile = sqlSession.selectList("library.listFile", memberNo);
		return (ArrayList<Upload>)listFile;
	}

	public ArrayList<Link> listLink(SqlSessionTemplate sqlSession, int memberNo) {
		List listLink = sqlSession.selectList("library.listLink", memberNo);
		return (ArrayList<Link>)listLink;
	}

	public ArrayList<Member> selectMemberList(SqlSessionTemplate sqlSession, int proNo) {
		List selectMemberList = sqlSession.selectList("library.selectMemberList", proNo);
		return (ArrayList<Member>)selectMemberList;
	}

	public int insertTodo(SqlSessionTemplate sqlSession, Todo todo) {
		return sqlSession.insert("library.insertTodo", todo);
	}

}
