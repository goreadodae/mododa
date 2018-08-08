package kr.pe.mododa.calendar.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import kr.pe.mododa.calendar.model.vo.Schedule;
import kr.pe.mododa.post.model.vo.Post;
import kr.pe.mododa.project.model.vo.Project;



public interface CalendarDAO {
	
	
	public ArrayList<Project> projectSelectAll (SqlSessionTemplate sqlSession,int memberNo);
	public ArrayList<Post> postSelectAll (SqlSessionTemplate sqlSession,int postNo);
	public ArrayList<Schedule> calendarSchedule (SqlSessionTemplate sqlSession,int memberNo);
	public int calendarInsertSchedule (SqlSessionTemplate sqlSession,Schedule sc);
	public int updateSchedule (SqlSessionTemplate sqlSession,Schedule sc);
	public Schedule infoSchedule (SqlSessionTemplate sqlSession,int scheduleNo);
	public int deleteSchdule (SqlSessionTemplate sqlSession,int scheduleNo);
	public Project selectProjectOne (SqlSessionTemplate sqlSession,int scheduleNo);
	public Post selectPostOne (SqlSessionTemplate sqlSession,int scheduleNo);
	public ArrayList<Schedule> selectDozenProject (SqlSessionTemplate sqlSession,List<String> checkboxValues);
	
}
