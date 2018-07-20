package kr.pe.mododa.post.model.vo;

import java.util.Date;

public class Schedule {
	private int scNo;
	private int postNo;
	private int memberNo;
	private int proNo;
	private Date scStartDate;
	private Date scEndDate;
	private String scTitle;
	
	public Schedule() {}
	
	public Schedule(int scNo, int postNo, int memberNo, int proNo, Date scStartDate, Date scEndDate, String scTitle) {
		super();
		this.scNo = scNo;
		this.postNo = postNo;
		this.memberNo = memberNo;
		this.proNo = proNo;
		this.scStartDate = scStartDate;
		this.scEndDate = scEndDate;
		this.scTitle = scTitle;
	}
	public int getScNo() {
		return scNo;
	}
	public void setScNo(int scNo) {
		this.scNo = scNo;
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
	public int getProNo() {
		return proNo;
	}
	public void setProNo(int proNo) {
		this.proNo = proNo;
	}
	public Date getScStartDate() {
		return scStartDate;
	}
	public void setScStartDate(Date scStartDate) {
		this.scStartDate = scStartDate;
	}
	public Date getScEndDate() {
		return scEndDate;
	}
	public void setScEndDate(Date scEndDate) {
		this.scEndDate = scEndDate;
	}
	public String getScTitle() {
		return scTitle;
	}
	public void setScTitle(String scTitle) {
		this.scTitle = scTitle;
	}
	
}
