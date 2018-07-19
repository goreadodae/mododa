package kr.pe.mododa.library.model.vo;

import java.sql.Date;

public class Link {
	private int linkNo;
	private int postNo;
	private int memberNo;
	private Date linkDate;
	private String linkTitle;
	private String linkAddress;
	
	public Link() { }
	
	public Link(int linkNo, int postNo, int memberNo, Date linkDate, String linkTitle, String linkAddress) {
		super();
		this.linkNo = linkNo;
		this.postNo = postNo;
		this.memberNo = memberNo;
		this.linkDate = linkDate;
		this.linkTitle = linkTitle;
		this.linkAddress = linkAddress;
	}
	
	public int getLinkNo() {
		return linkNo;
	}
	public void setLinkNo(int linkNo) {
		this.linkNo = linkNo;
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
	public Date getLinkDate() {
		return linkDate;
	}
	public void setLinkDate(Date linkDate) {
		this.linkDate = linkDate;
	}
	public String getLinkTitle() {
		return linkTitle;
	}
	public void setLinkTitle(String linkTitle) {
		this.linkTitle = linkTitle;
	}
	public String getLinkAddress() {
		return linkAddress;
	}
	public void setLinkAddress(String linkAddress) {
		this.linkAddress = linkAddress;
	}

	
}
