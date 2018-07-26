package kr.pe.mododa.personal.model.vo;

public class SerDelPost { //글 검색, 삭제 등에 사용
	private int memberNo;//검색할때 사용할 회원 번호 저장
	private String keyword; //검색 키워드 저장
	private int postNo; // 글 번호 저장.
	
	public SerDelPost() {
		super();
		
	}


	public SerDelPost(int memberNo, String keyword,int postNo) {
		super();
		this.memberNo = memberNo;
		this.keyword = keyword;
		this.postNo = postNo;
	}


	public int getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}


	public String getKeyword() {
		return keyword;
	}


	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public int getPostNo() {
		return postNo;
	}


	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	
	
}
