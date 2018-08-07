package kr.pe.mododa.notice.model.dao;

import java.util.ArrayList;
import java.util.List;

import javax.xml.stream.events.Namespace;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.pe.mododa.notice.model.vo.Notice;
import kr.pe.mododa.notice.model.vo.NoticeList;
import kr.pe.mododa.notice.model.vo.SearchList;



@Repository("noticeDAO")
public class NoticeDAOImpl implements NoticeDAO {
	
	

	public List<Notice> getNoticeCurrentPage(SqlSessionTemplate sqlSession, int currentPage, int listPerCountPage) {

		// 시작 ,끝 게시물
		int startTotalBoard = currentPage * listPerCountPage - (listPerCountPage - 1);//3페이지 눌렀다면 21
		int endTotalBoard = currentPage * listPerCountPage;// 3페이지 눌렀다면 30

		
    
//		List<Notice> list = new ArrayList<Notice>();

		NoticeList listNotice = new NoticeList();
		listNotice.setStartTotalBoard(startTotalBoard);
		listNotice.setEndTotalBoard(endTotalBoard);
		
		
			
		return sqlSession.selectList("notice.listNotice",listNotice);
		
	}

	public String getNoticePageCount(SqlSessionTemplate sqlSession, int currentPage, int listPerCountPage,
			int countPerPage) {
		// 게시물 총개수
		int TotalCount = 0;
		
		TotalCount = sqlSession.selectOne("notice.listCount");
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
			sb.append("<a class='item' href='/noticeList.do?currentPage=" + (startCount - 1) + "'><</i></a>");
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
			sb.append("<a class='item' href='/noticeList.do?currentPage=" + (endCount + 1) + "'>></i></a>"); 
		}
		
		return sb.toString();
	}

	public int viewCount(SqlSessionTemplate sqlSession, int noticeNo) {
		
		return sqlSession.update("notice.viewCount", noticeNo);
	}


	public Notice selectNoticeOne(SqlSessionTemplate sqlSession, int noticeNo) {
				
		return sqlSession.selectOne("notice.noticeDetail",noticeNo);
	}

	public List<Notice> getSearchCurrentPage(SqlSessionTemplate sqlSession, int currentPage, int listPerCountPage,
			String search, String searchOption) {
		
		   String option = null;
		   // 시작 ,끝 게시물
		   int startTotalBoard = currentPage * listPerCountPage - (listPerCountPage-1);
		   int endTotalBoard = currentPage*listPerCountPage;
	   
		   if(searchOption.equals("title")) {
		      option = "NOTICE_TITLE";
		   }else if (searchOption.equals("contents")) {
		      option = "NOTICE_CONTENTS";
		   }
		   
		   List<Notice> list = new ArrayList<Notice>();

			SearchList searchList = new SearchList();
			searchList.setStartTotalBoard(startTotalBoard);
			searchList.setEndTotalBoard(endTotalBoard);
			searchList.setOption(option);
			searchList.setSearch(search);
			
			
		   List<Notice> noticeList =  sqlSession.selectList("notice.searchList",searchList);
		   return noticeList;
	}

	public String getSearchPageCount(SqlSessionTemplate sqlSession, int currentPage, int listPerCountPage,
			int countPerPage, String search, String searchOption) {
		
		int TotalCount = 0; //게시물
		
		
		
		   String option = null;
		   //System.out.println("dao : " +searchOption);
		   if(searchOption.equals("title")) {
		      option = "NOTICE_TITLE";
		   }else if(searchOption.equals("contents")){
		      option = "NOTICE_CONTENTS";
		   }
		
		   SearchList searchCount = new SearchList();
		   
		   searchCount.setOption(option);
		   searchCount.setSearch(search);
		   
		  TotalCount = sqlSession.selectOne("notice.searchCount",searchCount);

		
		int pageTotalCount = 0;

		if (TotalCount % listPerCountPage != 0) {
			pageTotalCount = TotalCount / listPerCountPage + 1;
		} else {
			pageTotalCount = TotalCount / listPerCountPage;
		}

		if (currentPage < 1) {
			currentPage = 1;
		} else if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

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

		if (gotoPrev) {
			sb.append("<a class='item' href='/noticeSearch.do?searchOption="+searchOption+"&search=" + search + "&currentPage=" + (startCount - 1) + "'><i class='left chevron icon'></i></a>");

		}

		for (int i = startCount; i <= endCount; i++) {
			if (i == currentPage) {
				sb.append("<a class='item' href='/noticeSearch.do?searchOption="+searchOption+"&search=" + search + "&currentPage=" + i + "'><b>" + i + "</b></a>");

			} else {
				sb.append("<a class='item' href='/noticeSearch.do?searchOption="+searchOption+"&search="+search+"&currentPage=" + i + "'>" + i + "</a>");
			}
		}
		if (gotoNext) {
			sb.append("<a class='item' href='/noticeSearch.do?searchOption="+searchOption+"&search=" + search + "&currentPage=" + (endCount + 1) + "'><i class='right chevron icon'></i></a>");
		}

		return sb.toString();
		
	}

	public int insertNotice(SqlSessionTemplate sqlSession, Notice notice) {
		
		int result = sqlSession.insert("notice.insertNotice",notice);
		
		return result;
	}

	public int deleteNotice(SqlSessionTemplate sqlSession, int noticeNo) {

		return sqlSession.delete("notice.noticeDelete",noticeNo);
	
	}

	public Notice noticeUpdateReady(SqlSessionTemplate sqlSession, int noticeNo) {
		
		return sqlSession.selectOne("notice.noticeUpdateReady",noticeNo);
		
	}

	public int updateNotice(SqlSessionTemplate sqlSession, Notice notice) {
		
		return sqlSession.update("notice.noticeUpdate",notice);
	}

	
	





	
	
	

}
