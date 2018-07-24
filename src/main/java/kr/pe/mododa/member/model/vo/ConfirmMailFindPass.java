package kr.pe.mododa.member.model.vo;

import java.sql.Timestamp;

public class ConfirmMailFindPass {
	private String email;
	private String cfKey;
	private Timestamp cfTime;
	private String cfCategory;
	public ConfirmMailFindPass() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ConfirmMailFindPass(String email, String cfKey, Timestamp cfTime, String cfCategory) {
		this.email = email;
		this.cfKey = cfKey;
		this.cfTime = cfTime;
		this.cfCategory = cfCategory;
	}
	@Override
	public String toString() {
		return "ConfirmMailFindPass [email=" + email + ", cfKey=" + cfKey + ", cfTime=" + cfTime + ", cfCategory="
				+ cfCategory + "]";
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCfKey() {
		return cfKey;
	}
	public void setCfKey(String cfKey) {
		this.cfKey = cfKey;
	}
	public Timestamp getCfTime() {
		return cfTime;
	}
	public void setCfTime(Timestamp cfTime) {
		this.cfTime = cfTime;
	}
	public String getCfCategory() {
		return cfCategory;
	}
	public void setCfCategory(String cfCategory) {
		this.cfCategory = cfCategory;
	}
	
}
