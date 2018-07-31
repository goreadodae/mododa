package kr.pe.mododa.write.model.vo;

public class RelationSearchKey {
	private String searchKeyword;
	private int currentProNo ;
	
	
	public RelationSearchKey() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RelationSearchKey(String searchKeyword, int currentProNo) {
		super();
		this.searchKeyword = searchKeyword;
		this.currentProNo = currentProNo;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public int getCurrentProNo() {
		return currentProNo;
	}
	public void setCurrentProNo(int currentProNo) {
		this.currentProNo = currentProNo;
	}
	
	
	
	
	
	
	

	
	
}
