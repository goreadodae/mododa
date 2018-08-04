package kr.pe.mododa.library.model.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.pe.mododa.library.model.dao.LibraryDAOImpl;
import kr.pe.mododa.library.model.vo.Decision;
import kr.pe.mododa.library.model.vo.Link;
import kr.pe.mododa.library.model.vo.Todo;
import kr.pe.mododa.library.model.vo.Upload;
import kr.pe.mododa.member.model.vo.Member;
import kr.pe.mododa.project.model.vo.Project;

@Service("libraryService")
public class LibraryServiceImpl implements LibraryService{
	
	@Resource(name="libraryDAO")
	private LibraryDAOImpl libraryDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 전체 할 일 출력
	public ArrayList<Todo> listTodo(int memberNo) {
		return libraryDAO.listTodo(sqlSession, memberNo);
	}
	
	// 전체 의사결정 출력
	public ArrayList<Decision> listDecision(int memberNo) {
		return libraryDAO.listDecision(sqlSession, memberNo);
	}

	// 할 일 작성 시 프로젝트 선택
	public ArrayList<Project> listProject(int memberNo) {
		return libraryDAO.listProject(sqlSession, memberNo);
	}
	
	// 전체 이미지 출력
	public ArrayList<Upload> listImage(int memberNo) {
		return libraryDAO.listImage(sqlSession, memberNo);
	}

	// 전체 파일 출력
	public ArrayList<Upload> listFile(int memberNo) {
		return libraryDAO.listFile(sqlSession, memberNo);
	}
	
	// 전체 링크 출력
	public ArrayList<Link> listLink(int memberNo) {
		return libraryDAO.listLink(sqlSession, memberNo);
	}

	// 프로젝트 선언에 따른 멤버 리스트 출력
	public ArrayList<Member> selectMemberList(int proNo) {
		return libraryDAO.selectMemberList(sqlSession, proNo);
	}

	// 할 일 추가
	public int insertTodo(Todo todo) {
		return libraryDAO.insertTodo(sqlSession, todo);
	}

	// 내 할 일
	public ArrayList<Todo> listTodoMe(int memberNo) {
		return libraryDAO.listTodoMe(sqlSession, memberNo);
	}

	// 요청한 할 일
	public ArrayList<Todo> listTodoRequest(int memberNo) {
		return libraryDAO.listTodoRequest(sqlSession, memberNo);
	}
	
	// 받은 의사결정
	public ArrayList<Decision> listDcMe(int memberNo) {
		return libraryDAO.listDcMe(sqlSession, memberNo);
	}

	// 요청한 의사결정
	public ArrayList<Decision> listDcRequest(int memberNo) {
		return libraryDAO.listDcRequest(sqlSession, memberNo);
	}

	// 내 이미지
	public ArrayList<Upload> listImageMe(int memberNo) {
		return libraryDAO.listImageMe(sqlSession, memberNo);
	}

	// 프라이빗 번호 가져오기
	public int privateNo(int memberNo) {
		return libraryDAO.privateNo(sqlSession, memberNo);
	}

	// 내 파일 
	public ArrayList<Upload> listFileMe(int memberNo) {
		return libraryDAO.listFileMe(sqlSession, memberNo);
	}
	
	// 내 링크
	public ArrayList<Link> listLinkMe(int memberNo) {
		return libraryDAO.listLinkMe(sqlSession, memberNo);
	}

	// 의사결정 선택
	public int updateDecision(Decision dc) {
		return libraryDAO.updateDecision(sqlSession, dc);
	}

	// 할 일 수정
	public int updateTodo(Todo t) {
		return libraryDAO.updateTodo(sqlSession, t);
	}
	
	// 게시글이 속한 프로젝트의 멤버 불러오기
	public ArrayList<Member> todoContentMemberPost(int todoPostNo) {
		return libraryDAO.todoContentMemberPost(sqlSession, todoPostNo);
	}
	
	// 프로젝트별 할 일 출력
	public ArrayList<Todo> todoListPro(int proNo) {
		return libraryDAO.todoListPro(sqlSession, proNo);
	}
	
	// 프로젝트별 의사결정 출력
	public ArrayList<Decision> decisionListPro(int proNo) {
		return libraryDAO.decisionListPro(sqlSession, proNo);
	}
	
	// 할 일 삭제
	public int deleteTodo(int todoNo) {
		return libraryDAO.deleteTodo(sqlSession, todoNo);
	}

	// 의사결정 삭제
	public int deleteDecision(int dcNo) {
		return libraryDAO.deleteDecision(sqlSession, dcNo);
	}
}
