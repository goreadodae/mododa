package kr.pe.mododa.project.model.vo;

import java.sql.Date;

public class WorkOnProject {
	private int memberNo;
	private int proNo;
	private String proTitle;
	private Date proStartDate;
	private Date proEndDate;
	private String leaderId;
	private String leaderName;
	public WorkOnProject() {
		super();
		// TODO Auto-generated constructor stub
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
	public String getProTitle() {
		return proTitle;
	}
	public void setProTitle(String proTitle) {
		this.proTitle = proTitle;
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
	public String getLeaderId() {
		return leaderId;
	}
	public void setLeaderId(String leaderId) {
		this.leaderId = leaderId;
	}
	public String getLeaderName() {
		return leaderName;
	}
	public void setLeaderName(String leaderName) {
		this.leaderName = leaderName;
	}
	@Override
	public String toString() {
		return "WorkOnProject [memberNo=" + memberNo + ", proNo=" + proNo + ", proTitle=" + proTitle + ", proStartDate="
				+ proStartDate + ", proEndDate=" + proEndDate + ", leaderId=" + leaderId + ", leaderName=" + leaderName
				+ "]";
	}
	public WorkOnProject(int memberNo, int proNo, String proTitle, Date proStartDate, Date proEndDate, String leaderId,
			String leaderName) {
		this.memberNo = memberNo;
		this.proNo = proNo;
		this.proTitle = proTitle;
		this.proStartDate = proStartDate;
		this.proEndDate = proEndDate;
		this.leaderId = leaderId;
		this.leaderName = leaderName;
	}
}
