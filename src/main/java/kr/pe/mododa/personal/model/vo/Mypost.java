package kr.pe.mododa.personal.model.vo;

import java.sql.Date;

public class Mypost { //내가 작성한 글.
	
	private int postNo; //내 글 번호
	private String postTitle; //내 글 제목
	private String myName; //내이름
	private String myImg; //내 이미지 경로.
	private String postProgress;//내 글 진행상태
	private Date postDate;//내 글 작성 일
	private String proName;//글 작성된 프로젝트 이름
	
	public Mypost() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Mypost(int postNo, String postTitle, String myName, String myImg, String postProgress, Date postDate, String proName) {
		super();
		this.postNo = postNo;
		this.postTitle = postTitle;
		this.myName = myName;
		this.myImg = myImg;
		this.postProgress = postProgress;
		this.postDate = postDate;
		this.proName = proName;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public String getMyName() {
		return myName;
	}

	public void setMyName(String myName) {
		this.myName = myName;
	}

	
	public String getMyImg() {
		return myImg;
	}

	public void setMyImg(String myImg) {
		this.myImg = myImg;
	}

	public String getPostProgress() {
		return postProgress;
	}

	public void setPostProgress(String postProgress) {
		this.postProgress = postProgress;
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
