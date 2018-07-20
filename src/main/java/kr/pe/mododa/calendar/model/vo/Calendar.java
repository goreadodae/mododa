package kr.pe.mododa.calendar.model.vo;

import java.sql.Date;

public class Calendar {
	
	private int scheduleNo;
	private int postNo;
	private int memNO;
	private Date startDate;
	private Date endDate;
	private int proNo;
	private String scTitle;
	
	public Calendar () {
		super();
	}

	
	@Override
	public String toString() {
		return "Calendar [scheduleNo=" + scheduleNo + ", postNo=" + postNo + ", memNO=" + memNO + ", startDate="
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


	public int getMemNO() {
		return memNO;
	}


	public void setMemNO(int memNO) {
		this.memNO = memNO;
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


	public String getScTitle() {
		return scTitle;
	}


	public void setScTitle(String scTitle) {
		this.scTitle = scTitle;
	}


	
	
	
	
	
	

}
