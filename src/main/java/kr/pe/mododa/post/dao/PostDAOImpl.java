package kr.pe.mododa.post.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.pe.mododa.calendar.model.vo.Schedule;
import kr.pe.mododa.library.model.vo.Decision;
import kr.pe.mododa.library.model.vo.Todo;
import kr.pe.mododa.library.model.vo.Upload;
import kr.pe.mododa.member.model.vo.Member;
import kr.pe.mododa.personal.model.vo.Bookmark;
import kr.pe.mododa.post.model.vo.Comment;
import kr.pe.mododa.post.model.vo.Post;
import kr.pe.mododa.post.model.vo.PostLike;
import kr.pe.mododa.project.model.vo.Project;


@Repository("postDAO")
public class PostDAOImpl implements PostDAO{
	
	public Project selectOneProject(SqlSessionTemplate sqlSession, int postNo) {
		return sqlSession.selectOne("post.selectProject",postNo);
	}
	
	public Post selectOnePost(SqlSessionTemplate sqlSession, int postNo) {
		return sqlSession.selectOne("post.selectOnePost", postNo);	
	}
	
	public Bookmark selectBookmark(SqlSessionTemplate sqlSession, Bookmark vo) {
		return sqlSession.selectOne("post.selectBookmark",vo);                           
	}
	
	public PostLike selectPostLike(SqlSessionTemplate sqlSession, PostLike vo) {
		return sqlSession.selectOne("post.selectPostLike",vo);
	}
	
	public int selectPostLikeCount(SqlSessionTemplate sqlSession, int postNo) { //0801 아름 추가
		return sqlSession.selectOne("post.selectPostLikeCount", postNo);
	}
	
	
	public List<Schedule> selectSchedule(SqlSessionTemplate sqlSession, int postNo) {
		return sqlSession.selectList("post.selectSchedule", postNo);
	}
	
	public List<Todo> selectTodo(SqlSessionTemplate sqlSession, int postNo){
		return sqlSession.selectList("post.selectTodo",postNo);
	}
	
	public List<Upload> selectUpload(SqlSessionTemplate sqlSession, int postNo){
		return sqlSession.selectList("post.selectUpload",postNo);
	}
	
	public List<Decision> selectDecision(SqlSessionTemplate sqlSession, int postNo){
		return sqlSession.selectList("post.selectDecision",postNo);
	}
	
	public Decision selectOneDecision(SqlSessionTemplate sqlSession, int dcNo) {
		return sqlSession.selectOne("post.selectOneDecision", dcNo);
	}
	
	public List<Member> selectMembers(SqlSessionTemplate sqlSession, int postNo){
		return sqlSession.selectList("post.selectMembers",postNo);
	}
	
	public Member selectMemberInfo(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("post.selectMemberInfo", memberNo);
	}

	public int insertTodo(SqlSessionTemplate sqlSession, Todo vo) {
		return sqlSession.insert("post.insertTodo",vo);
	}
	
	public int insertSchedule(SqlSessionTemplate sqlSession, Schedule vo) {
		return sqlSession.insert("post.insertSchedule",vo);
	}

	public int insertDecision(SqlSessionTemplate sqlSession, Decision vo) {
		return sqlSession.insert("post.insertDecision",vo);
	}
	
	public int deleteTodo(SqlSessionTemplate sqlSession,int todoNo) {
		return sqlSession.delete("post.deleteTodo",todoNo);
	}
	
	public int deleteSchedule(SqlSessionTemplate sqlSession, int scNo) {
		return sqlSession.delete("post.deleteSchedule",scNo);
	}
	
	public int deleteDecision(SqlSessionTemplate sqlSession, int dcNo) {
		return sqlSession.delete("post.deleteDecision",dcNo);
	}
	
	public int updatePost(SqlSessionTemplate sqlSession, Post vo) {
		return sqlSession.update("post.updatePost", vo);
	}
	
	public int updateTodo(SqlSessionTemplate sqlSession, Todo vo) {
		return sqlSession.update("post.updateTodo", vo);
	}
	
	public int updateSchedule(SqlSessionTemplate sqlSession, Schedule vo) {
		return sqlSession.update("post.updateSchedule",vo);
	}
	
	public int updateDecision(SqlSessionTemplate sqlSession, Decision vo) {
		return sqlSession.update("post.updateDecision",vo);
	}
	
	public int updatePostProgress(SqlSessionTemplate sqlSession, Post vo) {
		return sqlSession.update("post.updatePostProgress",vo);
	}
	
	public int updateTodoProgress(SqlSessionTemplate sqlSession, Todo vo) {
		return sqlSession.update("post.updateTodoProgress",vo);
	}
	
	public ArrayList<Comment> selectComment(SqlSessionTemplate sqlSession, int postNo) { //준석 수정.
		List listComment = sqlSession.selectList("post.selectComment",postNo);
		return (ArrayList<Comment>)listComment;
	}
  
	public int insertBookmark(SqlSessionTemplate sqlSession, Bookmark vo) {
		return sqlSession.insert("post.insertBookmark",vo);
	}
	
	public int deleteBookmark(SqlSessionTemplate sqlSession, Bookmark vo) {
		return sqlSession.insert("post.deleteBookmark",vo);
	}

	public int insertPostLike(SqlSessionTemplate sqlSession, PostLike vo) { //0801 아름 추가
		return sqlSession.insert("post.insertPostLike", vo);
	}
	
	public int deletePostLike(SqlSessionTemplate sqlSession, PostLike vo) { //0801 아름 추가
		return sqlSession.delete("post.deletePostLike",vo);
	}

	public int insertComment(SqlSessionTemplate sqlSession, Post vo) { //준석 추가(댓글 입력)
		return sqlSession.insert("post.insertComment",vo);
	}

	public int deleteComment(SqlSessionTemplate sqlSession, int commentNo) { //0802준석추가
		return sqlSession.delete("post.deleteComment", commentNo);
	}
	
	public int deletePost(SqlSessionTemplate sqlSession, int postNo) {
		return sqlSession.delete("post.deletePost", postNo);
		
	}
	
	public int insertFile(SqlSessionTemplate sqlSession, Upload vo) {
		return sqlSession.insert("post.insertUpload",vo);	
	}
}
