package kr.pe.mododa.post.model.vo;

public class Comment {

	private String writeNick; //댓글 작성한 사람의 닉네임
	private int writerNo; //댓글 작성한 회원의 회원번호 (댓글 삭제하려면 세션의 회원번호와 작성자의 회원번호를 비교해야 함)
	private String writePicture;//댓글 작성한 사람의 이미지 경로
	private String writeTime;//댓글 작성한 시간(to_char이용하여 년,월,일, 시,분,초 변환하여 받아옴.)
	private String content; //댓글 내용
	private int postNo;//글번호
	private int commentNo;//댓글 번호
	public Comment() {
		super();
	}
	public Comment(String writeNick, int writerNo, String writePicture, String writeTime, String content, int postNo, int commentNo) {
		super();
		this.writeNick = writeNick;
		this.writerNo = writerNo;
		this.writePicture = writePicture;
		this.writeTime = writeTime;
		this.content = content;
		this.postNo = postNo;
		this.commentNo = commentNo;
	}
	public String getWriteNick() {
		return writeNick;
	}
	public void setWriteNick(String writeNick) {
		this.writeNick = writeNick;
	}
	
	public int getWriterNo() {
		return writerNo;
	}
	public void setWriterNo(int writerNo) {
		this.writerNo = writerNo;
	}
	public String getWritePicture() {
		return writePicture;
	}
	public void setWritePicture(String writePicture) {
		this.writePicture = writePicture;
	}
	public String getWriteTime() {
		return writeTime;
	}
	public void setWriteTime(String writeTime) {
		this.writeTime = writeTime;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	
	
	
}
