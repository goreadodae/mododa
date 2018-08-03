package kr.pe.mododa.post.model.vo;

public class PostCommentLike {
	private int memberNo; //댓글 좋아요 누른 회원의 회원번호
	private int postNo; //글번호
	private int commentNo;//댓글번호
	public PostCommentLike(int memberNo, int postNo, int commentNo) {
		super();
		this.memberNo = memberNo;
		this.postNo = postNo;
		this.commentNo = commentNo;
	}
	public PostCommentLike() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
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
