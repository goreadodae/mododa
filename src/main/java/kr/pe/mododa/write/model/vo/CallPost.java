package kr.pe.mododa.write.model.vo;

public class CallPost {
	private int callPostNo;
	private int callMember;
	public CallPost() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CallPost(int callPostNo, int callMember) {
		super();
		this.callPostNo = callPostNo;
		this.callMember = callMember;
	}
	public int getCallPostNo() {
		return callPostNo;
	}
	public void setCallPostNo(int callPostNo) {
		this.callPostNo = callPostNo;
	}
	public int getCallMember() {
		return callMember;
	}
	public void setCallMember(int callMember) {
		this.callMember = callMember;
	}

	
}
