package kr.pe.mododa.project.model.vo;

public class ProjectPostList {
	
	private int postNo;
	private String postTitle;
	private String postProgress;
	private String postDate;
	private String postContent;
	private int postWriter;
	private String postTemp;
	private int postProNo;
	private String postTag;
	// 추가로 필요한 부분
	private String memberName;
	private String memberPicture;
	
	
	public ProjectPostList() {
		super();
		// TODO Auto-generated constructor stub
	}


	public ProjectPostList(int postNo, String postTitle, String postProgress, String postDate, String postContent,
			int postWriter, String postTemp, int postProNo, String postTag, String memberName, String memberPicture) {
		super();
		this.postNo = postNo;
		this.postTitle = postTitle;
		this.postProgress = postProgress;
		this.postDate = postDate;
		this.postContent = postContent;
		this.postWriter = postWriter;
		this.postTemp = postTemp;
		this.postProNo = postProNo;
		this.postTag = postTag;
		this.memberName = memberName;
		this.memberPicture = memberPicture;
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


	public String getPostDate() {
		return postDate;
	}


	public void setPostDate(String postDate) {
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


	public String getMemberName() {
		return memberName;
	}


	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}


	public String getMemberPicture() {
		return memberPicture;
	}


	public void setMemberPicture(String memberPicture) {
		this.memberPicture = memberPicture;
	}


	@Override
	public String toString() {
		return "ProjectPostList [postNo=" + postNo + ", postTitle=" + postTitle + ", postProgress=" + postProgress
				+ ", postDate=" + postDate + ", postContent=" + postContent + ", postWriter=" + postWriter
				+ ", postTemp=" + postTemp + ", postProNo=" + postProNo + ", postTag=" + postTag + ", memberName="
				+ memberName + ", memberPicture=" + memberPicture + "]";
	}



	
	
	
	

}
