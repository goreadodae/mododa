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
import kr.pe.mododa.personal.model.vo.SerDelPost;
import kr.pe.mododa.post.model.vo.Post;

@Service("personalService")
public class PersonalServiceImpl implements PersonalService {

	@Resource(name="personalDAO")
	private PersonalDAOImpl personalDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Newsfeed> selectAllNewsFeed(int memberNo) {
		ArrayList<Newsfeed> newsfeed = personalDAO.selectAllNewsFeed(sqlSession,memberNo);
		return newsfeed;
	}

	public ArrayList<Bookmark> selectBookmark(int memberNo) {
		ArrayList<Bookmark>bookmark = personalDAO.selectBookmark(sqlSession,memberNo);
		return bookmark;
	}

	public ArrayList<Mypost> selectMypost(int memberNo) {
		ArrayList<Mypost> mypost = personalDAO.selectMypost(sqlSession,memberNo);
		return mypost;
	}

	public ArrayList<Mypost> searchTitle(Post p) { //내가쓴 글에서 제목 검색
		ArrayList<Mypost> searchTitle = personalDAO.searchTitle(sqlSession,p);
		return searchTitle;
	}

	public int delBookmark(Post p) {
		int delBookmark = personalDAO.delBookmark(sqlSession,p);
		return delBookmark;
	}
	
	public ArrayList<Bookmark> searchBookmark(SerDelPost sdp) {
		ArrayList<Bookmark> searchBook = personalDAO.searchBookmark(sqlSession,sdp);
		return searchBook;
	}

	public ArrayList<Newsfeed> searchNews(SerDelPost sdp) {
		ArrayList<Newsfeed> searchFeed = personalDAO.searchNews(sqlSession,sdp);
		return searchFeed;
	}

	public ArrayList<Newsfeed> searchCall(SerDelPost sdp) {
		ArrayList<Newsfeed> searchCallPost = personalDAO.searchCall(sqlSession,sdp);
		return searchCallPost;
	}

	public ArrayList<Newsfeed> selectCallPost(int memberNo) {
		ArrayList<Newsfeed> callPost = personalDAO.selectCallPost(sqlSession,memberNo);
		return callPost;
	}
	
	
}
