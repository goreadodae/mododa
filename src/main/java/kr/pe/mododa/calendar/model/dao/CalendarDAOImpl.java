package kr.pe.mododa.calendar.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.pe.mododa.calendar.model.vo.Schedule;
import kr.pe.mododa.post.model.vo.Post;
import kr.pe.mododa.project.model.vo.Project;

@Repository("CalendarDAO")
public class CalendarDAOImpl implements CalendarDAO {

	@Override
	public ArrayList<Project> projectSelectAll(SqlSessionTemplate sqlSession) {
		
		List list = sqlSession.selectList("calendar.projectList");
		
		return (ArrayList<Project>)list;
	}

	@Override
	public ArrayList<Post> postSelectAll(SqlSessionTemplate sqlSession,int postProNo) {

		List list = sqlSession.selectList("calendar.postList",postProNo);
		
		return (ArrayList<Post>)list;
		
	}

	@Override
	public ArrayList<Schedule> calendarSchedule(SqlSessionTemplate sqlSession) {
		
		List list = sqlSession.selectList("calendar.calendarScheduleList");

		return (ArrayList<Schedule>)list;
	}

	@Override
	public int calendarInsertSchedule(SqlSessionTemplate sqlSession, Schedule sc) {

		return sqlSession.insert("calendar.calendarInsertSchedule",sc);
	}

	
	
}
