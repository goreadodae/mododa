package kr.pe.mododa.calendar.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import kr.pe.mododa.project.model.vo.Project;



public interface CalendarDAO {
	
	
	public ArrayList<Project> projectSelectAll (SqlSessionTemplate sqlSession);

	
	
}
