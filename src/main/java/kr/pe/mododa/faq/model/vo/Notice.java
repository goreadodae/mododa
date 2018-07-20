package kr.pe.mododa.faq.model.vo;

import java.sql.Date;

public class Notice {
	private int noticeNo;
	private String noticeTitle;
	private String noticeContents;
	private Date noticeWriteDate;
	private int noticeViewCount;
	
	public Notice() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Notice(int noticeNo, String noticeTitle, String noticeContents, Date noticeWriteDate, int noticeViewCount) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContents = noticeContents;
		this.noticeWriteDate = noticeWriteDate;
		this.noticeViewCount = noticeViewCount;
	}
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContents() {
		return noticeContents;
	}
	public void setNoticeContents(String noticeContents) {
		this.noticeContents = noticeContents;
	}
	public Date getNoticeWriteDate() {
		return noticeWriteDate;
	}
	public void setNoticeWriteDate(Date noticeWriteDate) {
		this.noticeWriteDate = noticeWriteDate;
	}
	public int getNoticeViewCount() {
		return noticeViewCount;
	}
	public void setNoticeViewCount(int noticeViewCount) {
		this.noticeViewCount = noticeViewCount;
	}

	
	
}
	
	
