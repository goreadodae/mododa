package kr.pe.mododa.write.model.vo;

import oracle.sql.TIMESTAMP;

public class Upload {
	private int uploadNo;
	private int postNo;
	private int memberNo;
	private TIMESTAMP uploadDate;
	private String uploadSubject;
	private String uploadPath;
	
	
	
	public Upload() {
		super();
	
	}



	public Upload(int uploadNo, int postNo, int memberNo, TIMESTAMP uploadDate, String uploadSubject,
			String uploadPath) {
		super();
		this.uploadNo = uploadNo;
		this.postNo = postNo;
		this.memberNo = memberNo;
		this.uploadDate = uploadDate;
		this.uploadSubject = uploadSubject;
		this.uploadPath = uploadPath;
	}



	public int getUploadNo() {
		return uploadNo;
	}



	public void setUploadNo(int uploadNo) {
		this.uploadNo = uploadNo;
	}



	public int getPostNo() {
		return postNo;
	}



	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}



	public int getMemberNo() {
		return memberNo;
	}



	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}



	public TIMESTAMP getUploadDate() {
		return uploadDate;
	}



	public void setUploadDate(TIMESTAMP uploadDate) {
		this.uploadDate = uploadDate;
	}



	public String getUploadSubject() {
		return uploadSubject;
	}



	public void setUploadSubject(String uploadSubject) {
		this.uploadSubject = uploadSubject;
	}



	public String getUploadPath() {
		return uploadPath;
	}



	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}
	
	
	
	
	

}
