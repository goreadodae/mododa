package kr.pe.mododa.write.model.vo;

public class RelatedPost {
	private int rpNo;
	private int postNo;
	private int projectNo;
	public RelatedPost() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RelatedPost(int rpNo, int postNo, int projectNo) {
		super();
		this.rpNo = rpNo;
		this.postNo = postNo;
		this.projectNo = projectNo;
	}
	public int getRpNo() {
		return rpNo;
	}
	public void setRpNo(int rpPostNo) {
		this.rpNo = rpPostNo;
	}
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public int getProjectNo() {
		return projectNo;
	}
	public void setProjectNo(int projectNo) {
		this.projectNo = projectNo;
	}
	
	

}
