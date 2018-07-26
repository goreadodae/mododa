package kr.pe.mododa.post.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.pe.mododa.calendar.model.vo.Schedule;
import kr.pe.mododa.library.model.vo.Todo;
import kr.pe.mododa.post.model.vo.Post;


@Repository("postDAO")
public class PostDAOImpl implements PostDAO{
	
	public Post selectOnePost(SqlSessionTemplate sqlSession, int postNo) {
		return sqlSession.selectOne("post.selectOnePost", postNo);	
	}
	
	public List<Schedule> selectSchedule(SqlSessionTemplate sqlSession, int postNo) {
		return sqlSession.selectList("post.selectSchedule", postNo);
	}
	
	public List<Todo> selectTodo(SqlSessionTemplate sqlSession, int postNo){
		return sqlSession.selectList("post.selectTodo",postNo);
	}

	
	public int insertSchedule(SqlSessionTemplate sqlSession, Schedule vo) {
		return sqlSession.insert("post.insertSchedule",vo);
	}

}
