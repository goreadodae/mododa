package kr.pe.mododa.faq.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import kr.pe.mododa.faq.model.vo.Notice;


public interface FaqDAO {

	public ArrayList<Notice> noticeAll(SqlSessionTemplate sqlSession);
}
