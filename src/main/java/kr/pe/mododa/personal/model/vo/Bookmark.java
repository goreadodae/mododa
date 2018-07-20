package kr.pe.mododa.personal.model.vo;

import java.sql.Date;

public class Bookmark {
	private String postNo;       //북마크한 글의 글 번호
	private String postTitle;    //북마크한 글 제목
	private String postProgress; //북마크한 글의 진행 상태
	private String writerImg;    //북마크한 글의 작성자 이미지 경로
	private String postWriter;   //북마크한 글의 작성자
	private Date postDate;       //묵마크한 글 작성 일
	private String proName;      //북마크한 글 작성된 프로젝트 이름
	
	public Bookmark() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Bookmark(String postNo, String postTitle, String postProgress, String writerImg, String postWriter,
			Date postDate, String proName) {
		super();
		this.postNo = postNo;
		this.postTitle = postTitle;
		this.postProgress = postProgress;
		this.writerImg = writerImg;
		this.postWriter = postWriter;
		this.postDate = postDate;
		this.proName = proName;
	}

	public String getPostNo() {
		return postNo;
	}

	public void setPostNo(String postNo) {
		this.postNo = postNo;
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public String getPostProgress() {
		return postProgress;
	}

	public void setPostProgress(String postProgress) {
		this.postProgress = postProgress;
	}

	public String getWriterImg() {
		return writerImg;
	}

	public void setWriterImg(String writerImg) {
		this.writerImg = writerImg;
	}

	public String getPostWriter() {
		return postWriter;
	}

	public void setPostWriter(String postWriter) {
		this.postWriter = postWriter;
	}

	public Date getPostDate() {
		return postDate;
	}

	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}
	
	
	
	


}
