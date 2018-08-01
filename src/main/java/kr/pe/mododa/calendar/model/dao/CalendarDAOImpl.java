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
	public Project selectProjectOne(SqlSessionTemplate sqlSession, int scheduleNo) {
		
		return sqlSession.selectOne("calendar.projectOne",scheduleNo);
	}

	@Override
	public ArrayList<Post> postSelectAll(SqlSessionTemplate sqlSession,int postProNo) {

		List list = sqlSession.selectList("calendar.postList",postProNo);
		
		return (ArrayList<Post>)list;
		
	}
	
	@Override
	public Post selectPostOne(SqlSessionTemplate sqlSession, int scheduleNo) {
		
		return sqlSession.selectOne("calendar.postOne",scheduleNo);
		
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

	@Override
	public int updateSchedule(SqlSessionTemplate sqlSession, Schedule sc) {

		
		return sqlSession.update("calendar.calendarUpdateSchedule",sc);
	}

	@Override
	public Schedule infoSchedule(SqlSessionTemplate sqlSession, int scheduleNo) {
		
		return sqlSession.selectOne("calendar.calendarOneSchedule",scheduleNo);
		
	}

	@Override
	public int deleteSchdule(SqlSessionTemplate sqlSession, int scheduleNo) {
		
		return sqlSession.delete("calendar.calendarDeleteSchedule",scheduleNo);
		
	}

	@Override
	public ArrayList<Schedule> selectDozenProject(SqlSessionTemplate sqlSession, List<String> checkboxValues) {
		
		ArrayList<Schedule> scList = new ArrayList<Schedule>();
		
		for(int i =0;i<checkboxValues.size();i++) {
			
			if(checkboxValues.get(i).isEmpty()) {
				
			}else {
				int proNo = Integer.parseInt(checkboxValues.get(i));
				System.out.println(proNo);
			}
			
			
			/*Schedule sc = sqlSession.selectOne("calendar.selectDozenProject", proNo);
			
			scList.add(sc);*/
		}
		
		return scList;
		
	}





	
	
}
