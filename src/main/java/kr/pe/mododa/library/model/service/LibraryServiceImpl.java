package kr.pe.mododa.library.model.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.pe.mododa.library.model.dao.LibraryDAOImpl;
import kr.pe.mododa.library.model.vo.Link;
import kr.pe.mododa.library.model.vo.Todo;
import kr.pe.mododa.library.model.vo.Upload;
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
	public ArrayList<Todo> listDecision(int memberNo) {
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
}