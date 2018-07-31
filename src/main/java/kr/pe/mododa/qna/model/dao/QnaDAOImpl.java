package kr.pe.mododa.qna.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.pe.mododa.qna.model.vo.Qna;

@Repository("qnaDAO")

public class QnaDAOImpl {

	public ArrayList<Qna> qnaList(SqlSessionTemplate sqlSession, int memberNo) {
		

		return (ArrayList)sqlSession.selectList("qna.qnaList",memberNo);
		

		
	}

}
