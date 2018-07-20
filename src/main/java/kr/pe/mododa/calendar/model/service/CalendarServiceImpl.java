package kr.pe.mododa.calendar.model.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.pe.mododa.calendar.model.dao.CalendarDAOImpl;
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

	
}