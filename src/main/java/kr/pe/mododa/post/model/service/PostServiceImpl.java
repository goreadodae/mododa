package kr.pe.mododa.post.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.pe.mododa.calendar.model.vo.Schedule;
import kr.pe.mododa.library.model.vo.Todo;
import kr.pe.mododa.post.dao.PostDAOImpl;
import kr.pe.mododa.post.model.vo.Post;


@Service("postService")
public class PostServiceImpl implements PostService{
	@Resource(name="postDAO")
	private PostDAOImpl postDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public Post selectOnePost(int postNo) {
		return postDAO.selectOnePost(sqlSession, postNo);
	}
	
	public List<Schedule> selectSchedule(int postNo) {
		return postDAO.selectSchedule(sqlSession, postNo);
	}
	
	public List<Todo> selectTodo(int postNo){
		return postDAO.selectTodo(sqlSession, postNo);
	}
	

	public int insertSchedule(Schedule vo) {
		int result = postDAO.insertSchedule(sqlSession, vo);
		return result;
	}

	
	
	

}
