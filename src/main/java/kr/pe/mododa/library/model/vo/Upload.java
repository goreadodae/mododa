package kr.pe.mododa.library.model.vo;

import java.sql.Date;

public class Upload {
	private int uploadNo;
	private int postNo;
	private int memberNo;
	private Date uploadDate;
	private String uploadSubject;
	private String uploadPath;
	private String postTitle;
	private String fileName;
	public Upload() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Upload(int uploadNo, int postNo, int memberNo, Date uploadDate, String uploadSubject, String uploadPath,
			String postTitle, String fileName) {
		super();
		this.uploadNo = uploadNo;
		this.postNo = postNo;
		this.memberNo = memberNo;
		this.uploadDate = uploadDate;
		this.uploadSubject = uploadSubject;
		this.uploadPath = uploadPath;
		this.postTitle = postTitle;
		this.fileName = fileName;
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
	public Date getUploadDate() {
		return uploadDate;
	}
	public void setUploadDate(Date uploadDate) {
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
	public String getPostTitle() {
		return postTitle;
	}
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	
	
	
	
	
}
