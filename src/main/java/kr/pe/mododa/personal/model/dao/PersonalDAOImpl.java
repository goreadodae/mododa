package kr.pe.mododa.personal.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.pe.mododa.personal.model.vo.Newsfeed;

@Repository("personalDAO")
public class PersonalDAOImpl {

	public ArrayList<Newsfeed> selectAllNewsFeed(SqlSessionTemplate sqlSession) {
		List list = sqlSession.selectList("personal.selectAllNewsfeed");
		return null;
	}

}
