package kr.pe.mododa.faq.model.vo;

import java.util.List;

public class Page {
	private List<Notice> list;
	private String pageCount;
	
	public Page() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Page(List<Notice> list, String pageCount) {
		super();
		this.list = list;
		this.pageCount = pageCount;
	}
	public List<Notice> getList() {
		return list;
	}
	public void setList(List<Notice> list) {
		this.list = list;
	}
	public String getPageCount() {
		return pageCount;
	}
	public void setPageCount(String pageCount) {
		this.pageCount = pageCount;
	}
	
	
	
}
