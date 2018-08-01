package kr.pe.mododa.qna.model.vo;


import java.util.List;



public class qnaPage {
	private List<Qna> list;
	private String pageCount;
	
	
	public qnaPage() {
		super();
		// TODO Auto-generated constructor stub
	}
	public qnaPage(List<Qna> list, String pageCount) {
		super();
		this.list = list;
		this.pageCount = pageCount;
	}
	public List<Qna> getList() {
		return list;
	}
	public void setList(List<Qna> list) {
		this.list = list;
	}
	public String getPageCount() {
		return pageCount;
	}
	public void setPageCount(String pageCount) {
		this.pageCount = pageCount;
	}
	
	
	
}
