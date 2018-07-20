package kr.pe.mododa.member.model.vo;

public class Member {
	private int memberNo;
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberPicture;
	private String memberDepartName;
	private String memberMainTask;
	private String memberEmailCertify;
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Member(int memberNo, String memberId, String memberPw, String memberName, String memberPicture,
			String memberDepartName, String memberMainTask, String memberEmailCertify) {
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.memberPicture = memberPicture;
		this.memberDepartName = memberDepartName;
		this.memberMainTask = memberMainTask;
		this.memberEmailCertify = memberEmailCertify;
	}
	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberId=" + memberId + ", memberPw=" + memberPw + ", memberName="
				+ memberName + ", memberPicture=" + memberPicture + ", memberDepartName=" + memberDepartName
				+ ", memberMainTask=" + memberMainTask + ", memberEmailCertify=" + memberEmailCertify + "]";
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPw() {
		return memberPw;
	}
	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberPicture() {
		return memberPicture;
	}
	public void setMemberPicture(String memberPicture) {
		this.memberPicture = memberPicture;
	}
	public String getMemberDepartName() {
		return memberDepartName;
	}
	public void setMemberDepartName(String memberDepartName) {
		this.memberDepartName = memberDepartName;
	}
	public String getMemberMainTask() {
		return memberMainTask;
	}
	public void setMemberMainTask(String memberMainTask) {
		this.memberMainTask = memberMainTask;
	}
	public String getMemberEmailCertify() {
		return memberEmailCertify;
	}
	public void setMemberEmailCertify(String memberEmailCertify) {
		this.memberEmailCertify = memberEmailCertify;
	}
	
}
