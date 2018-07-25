package kr.pe.mododa.calendar.model.vo;

import java.sql.Date;

public class Schedule {
	
	private int scheduleNo;
	private int postNo;
	private int memNO;
	private Date startDate;
	private Date endDate;
	private String stStartDate;
	private String stEndDate;
	private int proNo;
	private String scTitle;
	
	public Schedule () {
		super();
	}
	
	

	@Override
	public String toString() {
		return "Schedule [scheduleNo=" + scheduleNo + ", postNo=" + postNo + ", memNO=" + memNO + ", startDate="
				+ startDate + ", endDate=" + endDate + ", stStartDate=" + stStartDate + ", stEndDate=" + stEndDate
				+ ", proNo=" + proNo + ", scTitle=" + scTitle + "]";
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

	public String getStStartDate() {
		return stStartDate;
	}

	public void setStStartDate(String stStartDate) {
		this.stStartDate = stStartDate;
	}

	public String getStEndDate() {
		return stEndDate;
	}

	public void setStEndDate(String stEndDate) {
		this.stEndDate = stEndDate;
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
