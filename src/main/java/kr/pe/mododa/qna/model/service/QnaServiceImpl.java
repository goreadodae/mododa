package kr.pe.mododa.qna.model.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.pe.mododa.notice.model.vo.Notice;
import kr.pe.mododa.qna.model.dao.QnaDAOImpl;
import kr.pe.mododa.qna.model.vo.Qna;
import kr.pe.mododa.qna.model.vo.qnaPage;

@Service("qnaService")
public class QnaServiceImpl {
	
	@Resource(name="qnaDAO")
	private QnaDAOImpl qnaDAO;

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	public int insertQuestion(Qna qna) {
		
		int result = qnaDAO.insertQuestion(sqlSession,qna);
		
		return result;
	}


	public qnaPage selectAll(int currentPage, int memberNo) {
		
		int recordCountPerPage = 10;
		int naviCountPerPage = 5;
		

		List<Qna> list = qnaDAO.getQnaCurrentPage(sqlSession, currentPage, recordCountPerPage,memberNo);
		String pageCount = qnaDAO.getQnaPageCount(sqlSession, currentPage, recordCountPerPage, naviCountPerPage);

		
		qnaPage page = null;
		if (!list.isEmpty() || !pageCount.isEmpty()) {
			page = new qnaPage();
			page.setList(list);
			page.setPageCount(pageCount);
		}

		
		
		return page;
	}




	

	
	

}
