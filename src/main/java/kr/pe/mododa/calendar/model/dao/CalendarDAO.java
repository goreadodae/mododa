package kr.pe.mododa.calendar.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import kr.pe.mododa.calendar.model.vo.Schedule;
import kr.pe.mododa.post.model.vo.Post;
import kr.pe.mododa.project.model.vo.Project;



public interface CalendarDAO {
	
	
	public ArrayList<Project> projectSelectAll (SqlSessionTemplate sqlSession);
	public ArrayList<Post> postSelectAll (SqlSessionTemplate sqlSession,int postNo);
	public ArrayList<Schedule> calendarSchedule (SqlSessionTemplate sqlSession);
	public int calendarInsertSchedule (SqlSessionTemplate sqlSession,Schedule sc);
	public int updateSchedule (SqlSessionTemplate sqlSession,Schedule sc);
	public Schedule infoSchedule (SqlSessionTemplate sqlSession,int scheduleNo);
	public int deleteSchdule (SqlSessionTemplate sqlSession,int scheduleNo);
	public Project selectProjectOne (SqlSessionTemplate sqlSession,int proNo);
	
}
