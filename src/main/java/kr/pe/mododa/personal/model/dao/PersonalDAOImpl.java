package kr.pe.mododa.personal.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.pe.mododa.personal.model.vo.Bookmark;
import kr.pe.mododa.personal.model.vo.Mypost;
import kr.pe.mododa.personal.model.vo.Newsfeed;

@Repository("personalDAO")
public class PersonalDAOImpl {

	public ArrayList<Newsfeed> selectAllNewsFeed(SqlSessionTemplate sqlSession, int memberNo) {
		List newsfeed = sqlSession.selectList("personal.selectAllNewsfeed",memberNo);
		return (ArrayList<Newsfeed>)newsfeed;
	}

	public ArrayList<Bookmark> selectBookmark(SqlSessionTemplate sqlSession, int memberNo) {
		List bookmark = sqlSession.selectList("personal.selectBookmark",memberNo);
		return (ArrayList<Bookmark>)bookmark;
	}

	public ArrayList<Mypost> selectMypost(SqlSessionTemplate sqlSession, int memberNo) {
		List mypost = sqlSession.selectList("personal.selectMypost", memberNo);
		return (ArrayList<Mypost>)mypost;
	}
	
	

}
