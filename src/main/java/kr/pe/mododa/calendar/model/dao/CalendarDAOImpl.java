package kr.pe.mododa.calendar.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.pe.mododa.project.model.vo.Project;

@Repository("CalendarDAO")
public class CalendarDAOImpl implements CalendarDAO {

	@Override
	public ArrayList<Project> projectSelectAll(SqlSessionTemplate sqlSession) {
		
		List list = sqlSession.selectList("calendar.projectList");
		
		return (ArrayList<Project>)list;
	}

	
	
}
