package kr.pe.mododa.calendar.model.service;

import java.util.ArrayList;
import java.util.List;

import kr.pe.mododa.calendar.model.vo.Schedule;
import kr.pe.mododa.post.model.vo.Post;
import kr.pe.mododa.project.model.vo.Project;

public interface CalendarService {

	public ArrayList<Project> projectSelectAll (int memberNo);
	public ArrayList<Post> postSelectAll (int postNo);
	public ArrayList<Schedule> calendarSchedule (int memberNo);
	public int calendarInsertSchedule (Schedule sc);
	public int updateSchedule (Schedule sc);
	public Schedule infoSchedule (int scheduleNo);
	public int deleteSchdule (int scheduleNo);
	public Project selectProjectOne (int scheduleNo); 
	public Post selectPostOne (int scheduleNo);
	public ArrayList<Schedule> selectDozenProject (List<String> checkboxValues);
	
}
