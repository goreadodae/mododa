package kr.pe.mododa.qna.model.vo;

import java.sql.Timestamp;

public class Question {
	private int queNo;
	private String queTitle;
	private Timestamp queTime;
	private String queContents;
	private int memberNo;
	private String responseYn;
	private String memberId;
	
	
	
	public Question() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Question(int queNo, String queTitle, Timestamp queTime, String queContents, int memberNo, String responseYn,
			String memberId) {
		super();
		this.queNo = queNo;
		this.queTitle = queTitle;
		this.queTime = queTime;
		this.queContents = queContents;
		this.memberNo = memberNo;
		this.responseYn = responseYn;
		this.memberId = memberId;
	}
	public int getQueNo() {
		return queNo;
	}
	public void setQueNo(int queNo) {
		this.queNo = queNo;
	}
	public String getQueTitle() {
		return queTitle;
	}
	public void setQueTitle(String queTitle) {
		this.queTitle = queTitle;
	}
	public Timestamp getQueTime() {
		return queTime;
	}
	public void setQueTime(Timestamp queTime) {
		this.queTime = queTime;
	}
	public String getQueContents() {
		return queContents;
	}
	public void setQueContents(String queContents) {
		this.queContents = queContents;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getResponseYn() {
		return responseYn;
	}
	public void setResponseYn(String responseYn) {
		this.responseYn = responseYn;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
	
	
}
