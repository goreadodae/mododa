package kr.pe.mododa.project.model.vo;

public class ProgressHelper {
	
	
	private String postProgress;
	private String[] postNo;
	

	public ProgressHelper() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ProgressHelper(String postProgress, String[] postNo) {
		super();
		this.postProgress = postProgress;
		this.postNo = postNo;
	}

	public String getPostProgress() {
		return postProgress;
	}

	public void setPostProgress(String postProgress) {
		this.postProgress = postProgress;
	}

	public String[] getPostNo() {
		return postNo;
	}

	public void setPostNo(String[] postNo) {
		this.postNo = postNo;
	}
	
	
	
	
	
	

}
