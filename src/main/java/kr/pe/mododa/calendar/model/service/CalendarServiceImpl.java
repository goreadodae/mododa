package kr.pe.mododa.calendar.model.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.pe.mododa.calendar.model.dao.CalendarDAOImpl;
import kr.pe.mododa.calendar.model.vo.Schedule;
import kr.pe.mododa.post.model.vo.Post;
import kr.pe.mododa.project.model.vo.Project;

@Service("CalendarService")
public class CalendarServiceImpl implements CalendarService {

	@Resource(name="CalendarDAO")
	private CalendarDAOImpl CalendarDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Project> projectSelectAll() {
		
		ArrayList<Project> list = CalendarDAO.projectSelectAll(sqlSession);
		
		return list;
	}
	
	@Override
	public Project selectProjectOne(int proNo) {
		
		Project P = CalendarDAO.selectProjectOne(sqlSession,proNo);
		
		return P;
	}

	@Override
	public ArrayList<Post> postSelectAll(int postProNo) {

		ArrayList<Post> list = CalendarDAO.postSelectAll(sqlSession,postProNo);
		
		return list;
	}

	@Override
	public ArrayList<Schedule> calendarSchedule() {
		
		ArrayList<Schedule> list = CalendarDAO.calendarSchedule(sqlSession);
	
		return list;
	}

	@Override
	public int calendarInsertSchedule(Schedule sc) {
		
		int result = CalendarDAO.calendarInsertSchedule(sqlSession,sc);
		
		return result;
	}

	@Override
	public int updateSchedule(Schedule sc) {
		
		int result = CalendarDAO.updateSchedule(sqlSession,sc);
		
		return result;
	}

	@Override
	public Schedule infoSchedule(int scheduleNo) {
		
		Schedule sc = CalendarDAO.infoSchedule(sqlSession,scheduleNo);
		
		return sc;
		
	}

	@Override
	public int deleteSchdule(int scheduleNo) {
		
		int result = CalendarDAO.deleteSchdule(sqlSession,scheduleNo);
		
		return result;
	}


	

	
}
