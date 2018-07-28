package kr.pe.mododa.personal.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.pe.mododa.personal.model.vo.Bookmark;
import kr.pe.mododa.personal.model.vo.Mypost;
import kr.pe.mododa.personal.model.vo.Newsfeed;
import kr.pe.mododa.personal.model.vo.SerDelPost;
import kr.pe.mododa.post.model.vo.Post;

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

	public ArrayList<Mypost> searchTitle(SqlSessionTemplate sqlSession, Post p) {
		List searchTitle = sqlSession.selectList("personal.searchTitle",p);
		return (ArrayList<Mypost>)searchTitle;
	}

	public int delBookmark(SqlSessionTemplate sqlSession, Post p) {
		int delBookmark = sqlSession.delete("personal.delBookmark", p);
		return delBookmark;
	}
	
	public ArrayList<Bookmark> searchBookmark(SqlSessionTemplate sqlSession, SerDelPost sdp) {
		List searchBook = sqlSession.selectList("personal.searchBookmark",sdp);
		return (ArrayList<Bookmark>)searchBook;
	}

	public ArrayList<Newsfeed> searchNews(SqlSessionTemplate sqlSession, SerDelPost sdp) {
		List searchFeed = sqlSession.selectList("personal.searchNews",sdp);
		return (ArrayList<Newsfeed>)searchFeed;
	}
	
	

}
