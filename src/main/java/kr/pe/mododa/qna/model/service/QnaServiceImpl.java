package kr.pe.mododa.qna.model.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.pe.mododa.qna.model.dao.QnaDAOImpl;
import kr.pe.mododa.qna.model.vo.Qna;

@Service("qnaService")
public class QnaServiceImpl {
	
	@Resource(name="qnaDAO")
	private QnaDAOImpl qnaDAO;

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<Qna> qnaList(int memberNo) {
		ArrayList<Qna> qnaList = qnaDAO.qnaList(sqlSession,memberNo);
		return qnaList;
	}

}
