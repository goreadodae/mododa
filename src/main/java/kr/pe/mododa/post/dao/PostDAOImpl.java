package kr.pe.mododa.post.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.pe.mododa.post.model.vo.Post;
import kr.pe.mododa.post.model.vo.Schedule;

@Repository("postDAO")
public class PostDAOImpl implements PostDAO{
	
	public Post selectOnePost(SqlSessionTemplate sqlSession, int postNo) {
		return sqlSession.selectOne("post.selectOnePost", postNo);	
	}

	public int insertSchedule(SqlSessionTemplate sqlSession, Schedule sc) {
		return sqlSession.insert("post.insertSchedule",sc);
	}

}
