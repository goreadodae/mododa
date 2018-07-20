package kr.pe.mododa.member.model.vo;

import java.sql.Date;

public class AutoLogin {
	private int autoNo;
	private int memberNo;
	private Date autoTime;
	private String autoKey;
	public AutoLogin() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AutoLogin(int autoNo, int memberNo, Date autoTime, String autoKey) {
		this.autoNo = autoNo;
		this.memberNo = memberNo;
		this.autoTime = autoTime;
		this.autoKey = autoKey;
	}
	@Override
	public String toString() {
		return "AutoLogin [autoNo=" + autoNo + ", memberNo=" + memberNo + ", autoTime=" + autoTime + ", autoKey="
				+ autoKey + "]";
	}
	public int getAutoNo() {
		return autoNo;
	}
	public void setAutoNo(int autoNo) {
		this.autoNo = autoNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public Date getAutoTime() {
		return autoTime;
	}
	public void setAutoTime(Date autoTime) {
		this.autoTime = autoTime;
	}
	public String getAutoKey() {
		return autoKey;
	}
	public void setAutoKey(String autoKey) {
		this.autoKey = autoKey;
	}
	
}
