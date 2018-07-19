package kr.pe.mododa.calendar.model.vo;

import java.sql.Date;

public class Calendar {
	
	private int scheduleNo;
	private int postNo;
	private String memId;
	private Date startDate;
	private Date endDate;
	private int proNo;
	
	public Calendar () {}
		
	@Override
	public String toString() {
		return "Calendar [scheduleNo=" + scheduleNo + ", postNo=" + postNo + ", memId=" + memId + ", startDate="
				+ startDate + ", endDate=" + endDate + ", proNo=" + proNo + "]";
	}
	public int getScheduleNo() {
		return scheduleNo;
	}
	public void setScheduleNo(int scheduleNo) {
		this.scheduleNo = scheduleNo;
	}
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public int getProNo() {
		return proNo;
	}
	public void setProNo(int proNo) {
		this.proNo = proNo;
	}
	
	
	

}
