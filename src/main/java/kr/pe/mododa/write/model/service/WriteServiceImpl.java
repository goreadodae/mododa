package kr.pe.mododa.write.model.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.pe.mododa.post.model.vo.Post;
import kr.pe.mododa.project.model.vo.Project;
import kr.pe.mododa.write.model.dao.WriteDAOImpl;

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

	public ArrayList<Post> relationWriteList(int currentProNo) {
		
		return (ArrayList)writeDAO.relationWriteList(sqlSession,currentProNo);
	}

}
