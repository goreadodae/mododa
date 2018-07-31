package kr.pe.mododa.project.model.vo;

public class SearchHelper {
	
	
	private String keyword;
	private int proNo;
	private int memberNo;
	private String projectValue;
	private String[] hashTags;
	
	
	public SearchHelper() {
		super();
		// TODO Auto-generated constructor stub
	}


	public SearchHelper(String keyword, int proNo, int memberNo, String projectValue, String[] hashTags) {
		super();
		this.keyword = keyword;
		this.proNo = proNo;
		this.memberNo = memberNo;
		this.projectValue = projectValue;
		this.hashTags = hashTags;
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


	public int getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}


	public String getProjectValue() {
		return projectValue;
	}


	public void setProjectValue(String projectValue) {
		this.projectValue = projectValue;
	}


	public String[] getHashTags() {
		return hashTags;
	}


	public void setHashTags(String[] hashTags) {
		this.hashTags = hashTags;
	}




	
	
	

}
