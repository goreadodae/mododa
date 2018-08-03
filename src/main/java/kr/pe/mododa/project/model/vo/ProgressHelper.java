package kr.pe.mododa.project.model.vo;

public class ProgressHelper {
	
	
	private String postProgress;
	private String[] postNo;
	private String proProgress;
	private String[] proNo;
	

	public ProgressHelper() {
		super();
		// TODO Auto-generated constructor stub
	}


	public ProgressHelper(String postProgress, String[] postNo, String proProgress, String[] proNo) {
		super();
		this.postProgress = postProgress;
		this.postNo = postNo;
		this.proProgress = proProgress;
		this.proNo = proNo;
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


	public String getProProgress() {
		return proProgress;
	}


	public void setProProgress(String proProgress) {
		this.proProgress = proProgress;
	}


	public String[] getProNo() {
		return proNo;
	}


	public void setProNo(String[] proNo) {
		this.proNo = proNo;
	}


	
	
	
	
	

}
