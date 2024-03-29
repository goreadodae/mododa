package kr.pe.mododa.qna.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.pe.mododa.qna.model.vo.Qna;
import kr.pe.mododa.qna.model.vo.QnaList;
import kr.pe.mododa.qna.model.vo.qnaPage;

@Repository("qnaDAO")

public class QnaDAOImpl {

	
	public int insertQuestion(SqlSessionTemplate sqlSession, Qna qna) {
		
		int result = sqlSession.insert("qna.qnaInsert",qna);
		
		return result;
		
	}

	public List<Qna> getQnaCurrentPage(SqlSessionTemplate sqlSession, int currentPage, int listPerCountPage,int memberNo) {
		
			// 시작 ,끝 게시물
				int startTotalBoard = currentPage * listPerCountPage - (listPerCountPage - 1);//3페이지 눌렀다면 21
				int endTotalBoard = currentPage * listPerCountPage;// 3페이지 눌렀다면 30
				
				
		    
//				List<Qna> list = new ArrayList<Qna>();
				
				QnaList listQna = new QnaList();
				listQna.setStartTotalBoard(startTotalBoard);
				listQna.setEndTotalBoard(endTotalBoard);
				listQna.setMemberNo(memberNo);
				
				
					
				return sqlSession.selectList("qna.qnaList",listQna);
	}

	public String getQnaPageCount(SqlSessionTemplate sqlSession, int currentPage, int listPerCountPage,
			int  countPerPage) {
		
		int TotalCount = 0;
		
		TotalCount = sqlSession.selectOne("qna.qnaListCount");
		int pageTotalCount = 0;

		if (TotalCount % listPerCountPage != 0) {
			pageTotalCount = TotalCount / listPerCountPage + 1;
		} else {
			pageTotalCount = TotalCount / listPerCountPage;
		}

		if (currentPage < 1) {
			currentPage = 1;
		} else if (currentPage > TotalCount) {
			currentPage = TotalCount;
		}
		// 시작 navi 구하기
		int startCount = ((currentPage - 1) / countPerPage) * countPerPage + 1;
		int endCount = startCount + countPerPage - 1;
		if (endCount > pageTotalCount) {
			endCount = pageTotalCount;
		}

		boolean gotoPrev = true;
		boolean gotoNext = true;
		if (startCount<0) {
			gotoPrev = false;
		}
		if (endCount == pageTotalCount) {
			gotoNext = false;
		}

		StringBuilder sb = new StringBuilder();
		// <button type='button' class='btn btn-secondary'>
		if(gotoPrev) { // 시작이 1페이지가 아니라면
			if(startCount == 1)
			{
				sb.append("<a class='item' href='/qnaList.do?currentPage=" + (startCount) + "'><button type='button' class='btn btn-secondary'> ◀ </button></a>");
			}
			else
			{
				sb.append("<a class='item' href='/qnaList.do?currentPage=" + (startCount - 1) + "'><button type='button' class='btn btn-secondary'> ◀ </button></a>");
			}
			}
			
		
		for(int i=startCount; i<=endCount; i++) {
			if(i == currentPage) {
				sb.append("<a class='item' href='/qnaList.do?currentPage=" + i + "'><button type='button' class='btn btn-secondary'>" + i + " </button></a>");
			}
			else {
				sb.append("<a class='item' href='/qnaList.do?currentPage=" + i + "'><button type='button' class='btn btn-secondary'> " + i + "</button> </a>");
			}
		}
		
		if(endCount == pageTotalCount) { 
			sb.append("<a class='item' href='/qnaList.do?currentPage=" + (endCount) + "'><button type='button' class='btn btn-secondary'> ▶ </button></a>"); 
		}
		else {
			sb.append("<a class='item' href='/qnaList.do?currentPage=" + (endCount + 1) + "'><button type='button' class='btn btn-secondary'> ▶ </button></a>"); 
		}
		
		return sb.toString();
		
	}

	public int deleteQna(SqlSessionTemplate sqlSession, int queNo) {
		
		return sqlSession.delete("qna.qnaDelete",queNo);

	}

	public Qna qnaUpdateReady(SqlSessionTemplate sqlSession, int queNo) {
		
		return sqlSession.selectOne("qna.qnaUpdateReady",queNo);

	}

	public int updateQna(SqlSessionTemplate sqlSession, Qna qna) {
		
		return sqlSession.update("qna.qnaUpdate",qna);
	}



	

	

	

	
	

}
