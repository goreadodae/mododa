package kr.pe.mododa.post.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.pe.mododa.calendar.model.vo.Schedule;
import kr.pe.mododa.library.model.vo.Decision;
import kr.pe.mododa.library.model.vo.Todo;
import kr.pe.mododa.member.model.vo.Member;
import kr.pe.mododa.post.model.vo.Post;
import kr.pe.mododa.project.model.vo.Project;


@Repository("postDAO")
public class PostDAOImpl implements PostDAO{
	
	public Project selectOneProject(SqlSessionTemplate sqlSession, int postNo) {
		return sqlSession.selectOne("post.selectProject",postNo);
	}
	
	public Post selectOnePost(SqlSessionTemplate sqlSession, int postNo) {
		return sqlSession.selectOne("post.selectOnePost", postNo);	
	}
	
	public List<Schedule> selectSchedule(SqlSessionTemplate sqlSession, int postNo) {
		return sqlSession.selectList("post.selectSchedule", postNo);
	}
	
	public List<Todo> selectTodo(SqlSessionTemplate sqlSession, int postNo){
		return sqlSession.selectList("post.selectTodo",postNo);
	}
	
	public Decision selectDecision(SqlSessionTemplate sqlSession, int postNo){
		Decision d =  sqlSession.selectOne("post.selectDecision",postNo);
		return d;
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
	
	public int deleteDecision(SqlSessionTemplate sqlSession, int postNo) {
		return sqlSession.delete("post.deleteDecision",postNo);
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
}
