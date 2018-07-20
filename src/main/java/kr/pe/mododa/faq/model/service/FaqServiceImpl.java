package kr.pe.mododa.faq.model.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.pe.mododa.faq.model.dao.FaqDAOImpl;
import kr.pe.mododa.faq.model.vo.Notice;

@Service("faqService")
public class FaqServiceImpl implements FaqService{

	@Resource(name="faqDAO")
	private FaqDAOImpl faqDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	


	@Override
	public ArrayList<Notice> noticeAll() {
		ArrayList<Notice> nlist = faqDAO.noticeAll(sqlSession);
		return nlist;
	}
}