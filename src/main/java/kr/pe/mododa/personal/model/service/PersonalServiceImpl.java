package kr.pe.mododa.personal.model.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.pe.mododa.personal.model.dao.PersonalDAOImpl;
import kr.pe.mododa.personal.model.vo.Newsfeed;

@Service("personalService")
public class PersonalServiceImpl implements PersonalService {

	@Resource(name="personalDAO")
	private PersonalDAOImpl personalDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Newsfeed> selectAllNewsFeed() {
		ArrayList<Newsfeed> newsfeed = personalDAO.selectAllNewsFeed(sqlSession);
		return null;
	}
	
	
}
