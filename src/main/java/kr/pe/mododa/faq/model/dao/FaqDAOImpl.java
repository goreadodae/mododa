package kr.pe.mododa.faq.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.pe.mododa.faq.model.vo.Notice;


@Repository("faqDAO")
public class FaqDAOImpl implements FaqDAO {

	@Override
	public ArrayList<Notice> noticeAll(SqlSessionTemplate sqlSession) {
		
		List nlist = sqlSession.selectList("faq.noticeList");
		
		return (ArrayList<Notice>)nlist;
	}

	@Override
	public Notice noticeRead(SqlSessionTemplate sqlSession, int noticeNo) {
		
		return sqlSession.selectOne("faq.noticeRead",noticeNo);
	}

}
