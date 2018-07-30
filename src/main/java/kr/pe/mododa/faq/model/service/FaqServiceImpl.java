package kr.pe.mododa.faq.model.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.pe.mododa.faq.model.dao.FaqDAOImpl;
import kr.pe.mododa.faq.model.vo.Notice;
import kr.pe.mododa.faq.model.vo.Page;

@Service("faqService")
public class FaqServiceImpl implements FaqService{

	@Resource(name="faqDAO")
	private FaqDAOImpl faqDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	public Page selectAll(int currentPage) {
		
		
		int recordCountPerPage = 10;
		int naviCountPerPage = 5;
		

		List<Notice> list = faqDAO.getNoticeCurrentPage(sqlSession, currentPage, recordCountPerPage);
		String pageCount = faqDAO.getNoticePageCount(sqlSession, currentPage, recordCountPerPage, naviCountPerPage);

		
		Page page = null;
		if (!list.isEmpty() && !pageCount.isEmpty()) {
			page = new Page();
			page.setList(list);
			page.setPageCount(pageCount);
		}

		return page;
	
	}
	





	public int viewCount(int noticeNo) {
		
		int result = faqDAO.viewCount(sqlSession, noticeNo);
		
		return result;
	}




	public Notice selectNoticeOne(int noticeNo) {

		Notice nContent = faqDAO.selectNoticeOne(sqlSession,noticeNo);
		
		return nContent;
		

	}



	public Page searchNotice(int currentPage, String search, String searchOption) {	
	
		int recordCountPerPage = 10;
		int naviCountPerPage = 5;

		List<Notice> list = faqDAO.getSearchCurrentPage(sqlSession, currentPage, recordCountPerPage,search,searchOption);
		String pageCount = faqDAO.getSearchPageCount(sqlSession,currentPage,recordCountPerPage,naviCountPerPage,search,searchOption);
		
		
		
		
		Page page = null;

		if (!list.isEmpty() && !pageCount.isEmpty()) {
			page = new Page();
			page.setList(list);
			page.setPageCount(pageCount);

		}

		return page;
	}






	public int insertNotice(Notice notice) {
		int result = faqDAO.insertNotice(sqlSession, notice);
		return result;
	}






	public int deleteNotice(int noticeNo) {

		int result = faqDAO.deleteNotice(sqlSession, noticeNo);

		return result;
	}
	
	

	
}