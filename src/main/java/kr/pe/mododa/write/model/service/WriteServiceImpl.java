package kr.pe.mododa.write.model.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.pe.mododa.project.model.vo.Project;
import kr.pe.mododa.write.model.dao.WriteDAOImpl;
import kr.pe.mododa.write.model.vo.RelationSearchKey;
import kr.pe.mododa.write.model.vo.RelationWriting;

@Service("writeService")
public class WriteServiceImpl implements WriteService{
	@Resource(name="writeDAO")
	private WriteDAOImpl writeDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Project> autoComplete(int memberNo) {
		return (ArrayList)writeDAO.autoComplete(sqlSession,memberNo);
		
		
	}

	public String currentProName(Project pj) {
		
		return writeDAO.currentProName(sqlSession,pj);
	}

	public ArrayList<RelationWriting> relationWritingList(int currentProNo) {
		
		return (ArrayList)writeDAO.relationWritingList(sqlSession,currentProNo);
	}

	public ArrayList<RelationWriting> searchWriting(RelationSearchKey rsKey) {
		
		return (ArrayList)writeDAO.searchWriting(sqlSession,rsKey);
	}

	public ArrayList<Project> myProject(int memberNo) {
		return (ArrayList)writeDAO.myProject(sqlSession,memberNo);
		
	}

	public ArrayList<RelationWriting> loadByProName(RelationWriting rw) {
		return (ArrayList)writeDAO.loadByProName(sqlSession,rw);
		
	}

}
