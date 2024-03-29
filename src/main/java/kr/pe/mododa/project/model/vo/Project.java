package kr.pe.mododa.project.model.vo;

import java.sql.Date;

public class Project {
	
	private int proNo;
	private String proTitle;
	private String proProgress;
	private Date proStartDate;
	private Date proEndDate;
	private int proMemberNo;
	
	public Project() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Project(int proNo, String proTitle, String proProgress, Date proStartDate, Date proEndDate, int proMemberNo) {
		super();
		this.proNo = proNo;
		this.proTitle = proTitle;
		this.proProgress = proProgress;
		this.proStartDate = proStartDate;
		this.proEndDate = proEndDate;
		this.proMemberNo = proMemberNo;
	}

	
	@Override
	public String toString() {
		return "Project [proNo=" + proNo + ", proTitle=" + proTitle + ", proProgress=" + proProgress + ", proStartDate="
				+ proStartDate + ", proEndDate=" + proEndDate + ", proMemberNo=" + proMemberNo + "]";
	}

	
	public int getProNo() {
		return proNo;
	}

	public void setProNo(int proNo) {
		this.proNo = proNo;
	}

	public String getProTitle() {
		return proTitle;
	}

	public void setProTitle(String proTitle) {
		this.proTitle = proTitle;
	}

	public String getProProgress() {
		return proProgress;
	}

	public void setProProgress(String proProgress) {
		this.proProgress = proProgress;
	}

	public Date getProStartDate() {
		return proStartDate;
	}

	public void setProStartDate(Date proStartDate) {
		this.proStartDate = proStartDate;
	}

	public Date getProEndDate() {
		return proEndDate;
	}

	public void setProEndDate(Date proEndDate) {
		this.proEndDate = proEndDate;
	}

	public int getProMemberNo() {
		return proMemberNo;
	}

	public void setProMemberNo(int proMemberNo) {
		this.proMemberNo = proMemberNo;
	}
	
	
	
	
	
	
	
	

}
