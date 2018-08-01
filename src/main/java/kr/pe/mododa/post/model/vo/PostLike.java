package kr.pe.mododa.post.model.vo;

public class PostLike {
	private int postNo;
	private int memberNo;
	
	public PostLike() {}
	
	public PostLike(int postNo, int memberNo) {
		super();
		this.postNo = postNo;
		this.memberNo = memberNo;
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
	
	
	
}
