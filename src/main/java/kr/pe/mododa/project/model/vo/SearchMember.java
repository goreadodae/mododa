package kr.pe.mododa.project.model.vo;

public class SearchMember {
	private int proNo;
	private String searchMemberText;
	public int getProNo() {
		return proNo;
	}
	public void setProNo(int proNo) {
		this.proNo = proNo;
	}
	public String getSearchMemberText() {
		return searchMemberText;
	}
	public void setSearchMemberText(String searchMemberText) {
		this.searchMemberText = searchMemberText;
	}
	@Override
	public String toString() {
		return "SearchMember [proNo=" + proNo + ", searchMemberText=" + searchMemberText + "]";
	}
	public SearchMember(int proNo, String searchMemberText) {
		this.proNo = proNo;
		this.searchMemberText = searchMemberText;
	}
	public SearchMember() {
		super();
		// TODO Auto-generated constructor stub
	}
}
