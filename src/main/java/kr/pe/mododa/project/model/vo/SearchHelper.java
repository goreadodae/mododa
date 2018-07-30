package kr.pe.mododa.project.model.vo;

public class SearchHelper {
	
	
	private String keyword;
	private int proNo;
	
	
	public SearchHelper() {
		super();
		// TODO Auto-generated constructor stub
	}


	public SearchHelper(String keyword, int proNo) {
		super();
		this.keyword = keyword;
		this.proNo = proNo;
	}


	
	public String getKeyword() {
		return keyword;
	}


	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}


	public int getProNo() {
		return proNo;
	}


	public void setProNo(int proNo) {
		this.proNo = proNo;
	}
	
	
	

}
