package kr.pe.mododa.post.model.vo;

import java.util.Date;

public class Post {
	private int postNo;
	private String postTitle;
	private String postProgress;
	private Date postDate;
	private String stPostData;
	private String postContent;
	private int postWriter;
	private String postWriterName;
	private String postWriterPicture;
	private String postTemp;
	private int postProNo;
	private String postTag;
	
	public Post() {}

	public Post(int postNo, String postTitle, String postProgress, Date postDate, String stPostData, String postContent,
			int postWriter, String postWriterName, String postWriterPicture, String postTemp, int postProNo,
			String postTag) {
		super();
		this.postNo = postNo;
		this.postTitle = postTitle;
		this.postProgress = postProgress;
		this.postDate = postDate;
		this.stPostData = stPostData;
		this.postContent = postContent;
		this.postWriter = postWriter;
		this.postWriterName = postWriterName;
		this.postWriterPicture = postWriterPicture;
		this.postTemp = postTemp;
		this.postProNo = postProNo;
		this.postTag = postTag;
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
	public Date getPostDate() {
		return postDate;
	}
	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}
	public String getPostContent() {
		return postContent;
	}
	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}
	public int getPostWriter() {
		return postWriter;
	}
	public void setPostWriter(int postWriter) {
		this.postWriter = postWriter;
	}
	
	public String getPostWriterName() {
		return postWriterName;
	}

	public void setPostWriterName(String postWriterName) {
		this.postWriterName = postWriterName;
	}

	public String getPostWriterPicture() {
		return postWriterPicture;
	}

	public void setPostWriterPicture(String postWriterPicture) {
		this.postWriterPicture = postWriterPicture;
	}

	public String getPostTemp() {
		return postTemp;
	}
	public void setPostTemp(String postTemp) {
		this.postTemp = postTemp;
	}
	public int getPostProNo() {
		return postProNo;
	}
	public void setPostProNo(int postProNo) {
		this.postProNo = postProNo;
	}
	public String getPostTag() {
		return postTag;
	}
	public void setPostTag(String postTag) {
		this.postTag = postTag;
	}

	public String getStPostData() {
		return stPostData;
	}

	public void setStPostData(String stPostData) {
		this.stPostData = stPostData;
	}
}
