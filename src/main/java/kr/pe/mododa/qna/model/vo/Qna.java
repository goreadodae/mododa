package kr.pe.mododa.qna.model.vo;

import java.sql.Date;


public class Qna {

	private int ansNo;
	private Date ansTime;
	private String ansContents;
	private int queNo;
	private int memberNo;
	private String queTitle;
	private String queContents;
	private String queResponseYn;
	private Date queTime;
	private String memberName;
	public Qna() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Qna(int ansNo, Date ansTime, String ansContents, int queNo, int memberNo, String queTitle,
			String queContents, String queResponseYn, Date queTime, String memberName) {
		super();
		this.ansNo = ansNo;
		this.ansTime = ansTime;
		this.ansContents = ansContents;
		this.queNo = queNo;
		this.memberNo = memberNo;
		this.queTitle = queTitle;
		this.queContents = queContents;
		this.queResponseYn = queResponseYn;
		this.queTime = queTime;
		this.memberName = memberName;
	}
	public int getAnsNo() {
		return ansNo;
	}
	public void setAnsNo(int ansNo) {
		this.ansNo = ansNo;
	}
	public Date  getAnsTime() {
		return ansTime;
	}
	public void setAnsTime(Date  ansTime) {
		this.ansTime = ansTime;
	}
	public String getAnsContents() {
		return ansContents;
	}
	public void setAnsContents(String ansContents) {
		this.ansContents = ansContents;
	}
	public int getQueNo() {
		return queNo;
	}
	public void setQueNo(int queNo) {
		this.queNo = queNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getQueTitle() {
		return queTitle;
	}
	public void setQueTitle(String queTitle) {
		this.queTitle = queTitle;
	}
	public String getQueContents() {
		return queContents;
	}
	public void setQueContents(String queContents) {
		this.queContents = queContents;
	}
	public String getQueResponseYn() {
		return queResponseYn;
	}
	public void setQueResponseYn(String queResponseYn) {
		this.queResponseYn = queResponseYn;
	}
	public Date getQueTime() {
		return queTime;
	}
	public void setQueTime(Date queTime) {
		this.queTime = queTime;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	
	
	
	
	
	

}
