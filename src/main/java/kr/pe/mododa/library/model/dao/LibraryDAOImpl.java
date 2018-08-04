package kr.pe.mododa.library.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.pe.mododa.library.model.vo.Decision;
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
	public ArrayList<Decision> listDecision(SqlSessionTemplate sqlSession, int memberNo) {
		List listDecision = sqlSession.selectList("library.listDecision", memberNo);
		return (ArrayList<Decision>)listDecision;
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

	public ArrayList<Todo> listTodoMe(SqlSessionTemplate sqlSession, int memberNo) {
		List listTodoMe = sqlSession.selectList("library.listTodoMe", memberNo);
		return (ArrayList<Todo>)listTodoMe;
	}

	public ArrayList<Todo> listTodoRequest(SqlSessionTemplate sqlSession, int memberNo) {
		List listTodoRequest = sqlSession.selectList("library.listTodoRequest", memberNo);
		return (ArrayList<Todo>)listTodoRequest;
	}

	public ArrayList<Decision> listDcMe(SqlSessionTemplate sqlSession, int memberNo) {
		List listDcMe = sqlSession.selectList("library.listDcMe", memberNo);
		return (ArrayList<Decision>)listDcMe;
	}

	public ArrayList<Decision> listDcRequest(SqlSessionTemplate sqlSession, int memberNo) {
		List listDcRequest = sqlSession.selectList("library.listDcRequest", memberNo);
		return (ArrayList<Decision>)listDcRequest;
	}

	public ArrayList<Upload> listImageMe(SqlSessionTemplate sqlSession, int memberNo) {
		List listImageMe = sqlSession.selectList("library.listImageMe", memberNo);
		return (ArrayList<Upload>)listImageMe;
	}

	public int privateNo(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("library.privateNo", memberNo);
	}

	public ArrayList<Upload> listFileMe(SqlSessionTemplate sqlSession, int memberNo) {
		List listFileMe = sqlSession.selectList("library.listFileMe", memberNo);
		return (ArrayList<Upload>)listFileMe;
	}

	public ArrayList<Link> listLinkMe(SqlSessionTemplate sqlSession, int memberNo) {
		List listLinkMe = sqlSession.selectList("library.listLinkMe", memberNo);
		return (ArrayList<Link>)listLinkMe;
	}

	public int updateDecision(SqlSessionTemplate sqlSession, Decision dc) {
		return sqlSession.update("library.updateDecision", dc);
	}

	public int updateTodo(SqlSessionTemplate sqlSession, Todo t) {
		return sqlSession.update("library.updateTodo", t);
	}

	public ArrayList<Member> todoContentMemberPost(SqlSessionTemplate sqlSession, int todoPostNo) {
		List todoContentMemberPost = sqlSession.selectList("library.todoContentMemberPost", todoPostNo);
		return (ArrayList<Member>)todoContentMemberPost;
	}

	public ArrayList<Todo> todoListPro(SqlSessionTemplate sqlSession, int proNo) {
		List todoListPro = sqlSession.selectList("library.todoListPro", proNo);
		return (ArrayList<Todo>)todoListPro;
	}

	public ArrayList<Decision> decisionListPro(SqlSessionTemplate sqlSession, int proNo) {
		List decisionListPro = sqlSession.selectList("library.decisionListPro", proNo);
		return (ArrayList<Decision>)decisionListPro;
	}

	public int deleteTodo(SqlSessionTemplate sqlSession, int todoNo) {
		return sqlSession.delete("library.deleteTodo", todoNo);
	}

	public int deleteDecision(SqlSessionTemplate sqlSession, int dcNo) {
		return sqlSession.delete("library.deleteDecision", dcNo);
	}

}
