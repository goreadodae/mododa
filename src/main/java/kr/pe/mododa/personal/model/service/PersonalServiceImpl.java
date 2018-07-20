package kr.pe.mododa.personal.model.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.pe.mododa.personal.model.dao.PersonalDAOImpl;
import kr.pe.mododa.personal.model.vo.Bookmark;
import kr.pe.mododa.personal.model.vo.Mypost;
import kr.pe.mododa.personal.model.vo.Newsfeed;

@Service("personalService")
public class PersonalServiceImpl implements PersonalService {

	@Resource(name="personalDAO")
	private PersonalDAOImpl personalDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Newsfeed> selectAllNewsFeed(int memberNo) {
		ArrayList<Newsfeed> newsfeed = personalDAO.selectAllNewsFeed(sqlSession,memberNo);
		return null;
	}

	public ArrayList<Bookmark> selectBookmark(int memberNo) {
		ArrayList<Bookmark>bookmark = personalDAO.selectBookmark(sqlSession,memberNo);
		return null;
	}

	public ArrayList<Mypost> selectMypost(int memberNo) {
		ArrayList<Mypost> mypost = personalDAO.selectMypost(sqlSession,memberNo);
		return mypost;
	}
	
	
}
