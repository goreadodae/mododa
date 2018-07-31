package kr.pe.mododa.notice.model.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.pe.mododa.notice.model.dao.NoticeDAOImpl;
import kr.pe.mododa.notice.model.vo.Notice;
import kr.pe.mododa.notice.model.vo.Page;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService{

	@Resource(name="noticeDAO")
	private NoticeDAOImpl noticeDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	public Page selectAll(int currentPage) {
		
		
		int recordCountPerPage = 10;
		int naviCountPerPage = 5;
		

		List<Notice> list = noticeDAO.getNoticeCurrentPage(sqlSession, currentPage, recordCountPerPage);
		String pageCount = noticeDAO.getNoticePageCount(sqlSession, currentPage, recordCountPerPage, naviCountPerPage);

		
		Page page = null;
		if (!list.isEmpty() && !pageCount.isEmpty()) {
			page = new Page();
			page.setList(list);
			page.setPageCount(pageCount);
		}

		return page;
	
	}
	





	public int viewCount(int noticeNo) {
		
		int result = noticeDAO.viewCount(sqlSession, noticeNo);
		
		return result;
	}




	public Notice selectNoticeOne(int noticeNo) {

		Notice nContent = noticeDAO.selectNoticeOne(sqlSession,noticeNo);
		
		return nContent;
		

	}



	public Page searchNotice(int currentPage, String search, String searchOption) {	
	
		int recordCountPerPage = 10;
		int naviCountPerPage = 5;

		List<Notice> list = noticeDAO.getSearchCurrentPage(sqlSession, currentPage, recordCountPerPage,search,searchOption);
		String pageCount = noticeDAO.getSearchPageCount(sqlSession,currentPage,recordCountPerPage,naviCountPerPage,search,searchOption);
		
		
		
		
		Page page = null;

		if (!list.isEmpty() && !pageCount.isEmpty()) {
			page = new Page();
			page.setList(list);
			page.setPageCount(pageCount);

		}

		return page;
	}






	public int insertNotice(Notice notice) {
		int result = noticeDAO.insertNotice(sqlSession, notice);
		return result;
	}






	public int deleteNotice(int noticeNo) {

		int result = noticeDAO.deleteNotice(sqlSession, noticeNo);

		return result;
	}






	public Notice noticeUpdateReady(int noticeNo) {
		
		
		Notice notice = noticeDAO.noticeUpdateReady(sqlSession, noticeNo);
		
		return notice;
		
		
	}



	public int updateNotice(Notice notice) {
		
		int result = noticeDAO.updateNotice(sqlSession, notice);

		return result;
		
	}






	



	
}