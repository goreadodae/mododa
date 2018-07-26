package kr.pe.mododa.faq.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.pe.mododa.faq.model.vo.Notice;
import kr.pe.mododa.faq.model.vo.NoticeList;


@Repository("faqDAO")
public class FaqDAOImpl implements FaqDAO {

	public List<Notice> getNoticeCurrentPage(SqlSessionTemplate sqlSession, int currentPage, int listPerCountPage) {

		// 시작 ,끝 게시물
		int startTotalBoard = currentPage * listPerCountPage - (listPerCountPage - 1);//3페이지 눌렀다면 21
		int endTotalBoard = currentPage * listPerCountPage;// 3페이지 눌렀다면 30

		
    
		List<Notice> list = new ArrayList<Notice>();

		NoticeList listNotice = new NoticeList();
		listNotice.setStartTotalBoard(startTotalBoard);
		listNotice.setEndTotalBoard(endTotalBoard);
		
		
			
		return sqlSession.selectList("faq.listNotice",listNotice);
		
	}

	public String getNoticePageCount(SqlSessionTemplate sqlSession, int currentPage, int listPerCountPage,
			int countPerPage) {
		// 게시물 총개수
		int TotalCount = 0;
		
		TotalCount = sqlSession.selectOne("faq.listCount");
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
		if (startCount == 1) {
			gotoPrev = false;
		}
		if (endCount == pageTotalCount) {
			gotoNext = false;
		}

		StringBuilder sb = new StringBuilder();
		
		if(gotoPrev) { // 시작이 1페이지가 아니라면
			sb.append("<a class='item' href='/noticeList.do?currentPage=" + (startCount - 1) + "'><i class='left chevron icon'></i></a>");
		}
		
		for(int i=startCount; i<=endCount; i++) {
			if(i == currentPage) {
				sb.append("<a class='item' href='/noticeList.do?currentPage=" + i + "'><b> " + i + " </b></a>");
			}
			else {
				sb.append("<a class='item' href='/noticeList.do?currentPage=" + i + "'> " + i + " </a>");
			}
		}
		
		if(gotoNext) { // 끝 페이지가 아니라면
			sb.append("<a class='item' href='/noticeList.do?currentPage=" + (endCount + 1) + "'><i class='right chevron icon'></i></a>"); 
		}
		
		return sb.toString();
	}



	
	
	

}
