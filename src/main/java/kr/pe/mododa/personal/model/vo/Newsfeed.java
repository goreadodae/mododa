package kr.pe.mododa.personal.model.vo;

import java.sql.Date;

public class Newsfeed {   //로그인 한 회원이 속한 프로젝트의 소식을 담을 객체..
	private int postNo;  //글 번호
	private String postTitle; //글 제목
	private String postProgress;//글 진행 상태.
	private String postWriter;//글 작성자
	private String pWriterImg;//글 작성자 이미지.
	private String postContent;//날짜에 따라서 (오늘날짜를 기준으로 1~2일 이내면 "새글이 작성되었어요", 지나면 내용 사라짐.할수 있겟죠??컼컼컼 
	private Date postDate;//글 작성일
	private String proName;//글이 작성된 프로젝트의 이름.
	
	public Newsfeed() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Newsfeed(int postNo, String postTitle,String postProgress, String postWriter, String pWriterImg, String postContent,
			Date postDate, String proName) {
		super();
		this.postNo = postNo;
		this.postTitle = postTitle;
		this.postProgress = postProgress;
		this.postWriter = postWriter;
		this.pWriterImg = pWriterImg;
		this.postContent = postContent;
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

	
	public String getPostProgress() {
		return postProgress;
	}

	public void setPostProgress(String postProgress) {
		this.postProgress = postProgress;
	}




	public String getPostWriter() {
		return postWriter;
	}



	public void setPostWriter(String postWriter) {
		this.postWriter = postWriter;
	}



	public String getpWriterImg() {
		return pWriterImg;
	}

	public void setpWriterImg(String pWriterImg) {
		this.pWriterImg = pWriterImg;
	}

	public String getPostContent() {
		return postContent;
	}

	public void setPostContent(String postContent) {
		this.postContent = postContent;
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
