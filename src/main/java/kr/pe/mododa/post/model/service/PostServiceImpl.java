package kr.pe.mododa.post.model.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.pe.mododa.calendar.model.vo.Schedule;
import kr.pe.mododa.library.model.vo.Decision;
import kr.pe.mododa.library.model.vo.Todo;
import kr.pe.mododa.member.model.vo.Member;
import kr.pe.mododa.personal.model.vo.Bookmark;
import kr.pe.mododa.post.dao.PostDAOImpl;
import kr.pe.mododa.post.model.vo.Comment;
import kr.pe.mododa.post.model.vo.Post;
import kr.pe.mododa.post.model.vo.PostLike;
import kr.pe.mododa.project.model.vo.Project;


@Service("postService")
public class PostServiceImpl implements PostService{
	@Resource(name="postDAO")
	private PostDAOImpl postDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public Project selectProject(int postNo) {
		return postDAO.selectOneProject(sqlSession, postNo);
	}
	
	public Post selectOnePost(int postNo) {
		return postDAO.selectOnePost(sqlSession, postNo);
	}
	
	public Bookmark selectBookmark(int postNo, int memberNo) {
		Bookmark vo = new Bookmark();
		vo.setPostNo(postNo);
		vo.setMemberNo(memberNo);
		return postDAO.selectBookmark(sqlSession, vo);
	}
	
	public PostLike selectPostLike(int postNo, int memberNo) {
		PostLike vo = new PostLike();
		vo.setPostNo(postNo);
		vo.setMemberNo(memberNo);
		return postDAO.selectPostLike(sqlSession, vo);
	}
	
	public int selectPostLikeCount(int postNo) {	//0801 아름 추가
		return postDAO.selectPostLikeCount(sqlSession, postNo);
	}
	
	public List<Schedule> selectSchedule(int postNo) {
		return postDAO.selectSchedule(sqlSession, postNo);
	}
	
	public List<Todo> selectTodo(int postNo){
		return postDAO.selectTodo(sqlSession, postNo);
	}
	
	public List<Decision> selectDecision(int postNo){
		return postDAO.selectDecision(sqlSession, postNo);
	}
	
	public Decision selectOneDecision(int dcNo) {
		return postDAO.selectOneDecision(sqlSession, dcNo);
	}
	
	public List<Member> selectMembers(int postNo){
		return postDAO.selectMembers(sqlSession, postNo);
	}
	
	public Member selectMemberInfo(int memberNo) {
		return postDAO.selectMemberInfo(sqlSession, memberNo);
	}

	public int insertTodo(Todo vo) {
		return postDAO.insertTodo(sqlSession, vo);
	}
	
	public int insertSchedule(Schedule vo) {
		return postDAO.insertSchedule(sqlSession, vo);
	}
	
	public int insertDecision(Decision vo) {
		return postDAO.insertDecision(sqlSession,vo);
	}

	public int deleteSchedule(int scNo) {
		return postDAO.deleteSchedule(sqlSession, scNo);
	}
	
	public int deleteDecision(int dcNo) {
		return postDAO.deleteDecision(sqlSession,dcNo);
	}
	
	public int updateSchedule(Schedule vo) {	//0801 아름 추가
		return postDAO.updateSchedule(sqlSession, vo);
	}

	public int updateDecision(Decision vo) {
		return postDAO.updateDecision(sqlSession,vo);
	}
	
	public int updatePostProgress(Post vo) {
		return postDAO.updatePostProgress(sqlSession,vo);
	}
	
	public int updateTodoProgress(Todo vo) {
		return postDAO.updateTodoProgress(sqlSession, vo);
	}
	
	public int insertBookmark(Bookmark vo) {
		return postDAO.insertBookmark(sqlSession, vo);
	}
	
	public int deleteBookmark(Bookmark vo) {
		return postDAO.deleteBookmark(sqlSession, vo);
	}
  
	public ArrayList<Comment> selectComment(int postNo) { //댓글 읽어오기 (준석 수정)
		return postDAO.selectComment(sqlSession, postNo);
	}
	
	public int insertPostLike(PostLike vo) {	//0801 아름 추가
		return postDAO.insertPostLike(sqlSession, vo);
	}
	
	public int deletePostLike(PostLike vo) {	//0801 아름 추가
		return postDAO.deletePostLike(sqlSession, vo);
	}
	
	

	public int insertComment(Post vo) { //댓글 입력(준석추가)
		// TODO Auto-generated method stub
		return postDAO.insertComment(sqlSession,vo);
	}

}

