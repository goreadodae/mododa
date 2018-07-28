package kr.pe.mododa.post.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.pe.mododa.calendar.model.vo.Schedule;
import kr.pe.mododa.library.model.vo.Decision;
import kr.pe.mododa.library.model.vo.Todo;
import kr.pe.mododa.member.model.vo.Member;
import kr.pe.mododa.post.dao.PostDAOImpl;
import kr.pe.mododa.post.model.vo.Post;
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
	
	public List<Schedule> selectSchedule(int postNo) {
		return postDAO.selectSchedule(sqlSession, postNo);
	}
	
	public List<Todo> selectTodo(int postNo){
		return postDAO.selectTodo(sqlSession, postNo);
	}
	
	public List<Member> selectMembers(int postNo){
		return postDAO.selectMembers(sqlSession, postNo);
	}

	public int insertTodo(Todo vo) {
		return postDAO.insertTodo(sqlSession, vo);
	}
	
	public Member selectMemberInfo(int memberNo) {
		return postDAO.selectMemberInfo(sqlSession, memberNo);
	}
	
	public int insertSchedule(Schedule vo) {
		return postDAO.insertSchedule(sqlSession, vo);
	}
	
	public int insertDecision(Decision vo) {
		return postDAO.insertDecision(sqlSession,vo);
	}


	

}
