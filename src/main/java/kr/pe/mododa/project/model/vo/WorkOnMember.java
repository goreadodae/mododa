package kr.pe.mododa.project.model.vo;

public class WorkOnMember {
	private int memberNo;
	private int proNo;
	private char leader;
	private char inviteYN;
	private String memberId;
	private String memberName;
	private String memberPicture;
	private String memberDepartName;
	private String memberMainTask;
	private char memberEmailCertify;
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
	public char getLeader() {
		return leader;
	}
	public void setLeader(char leader) {
		this.leader = leader;
	}
	public char getInviteYN() {
		return inviteYN;
	}
	public void setInviteYN(char inviteYN) {
		this.inviteYN = inviteYN;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
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
	public char getMemberEmailCertify() {
		return memberEmailCertify;
	}
	public void setMemberEmailCertify(char memberEmailCertify) {
		this.memberEmailCertify = memberEmailCertify;
	}
	@Override
	public String toString() {
		return "WorkOnMember [memberNo=" + memberNo + ", proNo=" + proNo + ", leader=" + leader + ", inviteYN="
				+ inviteYN + ", memberId=" + memberId + ", memberName=" + memberName + ", memberPicture="
				+ memberPicture + ", memberDepartName=" + memberDepartName + ", memberMainTask=" + memberMainTask
				+ ", memberEmailCertify=" + memberEmailCertify + "]";
	}
	public WorkOnMember(int memberNo, int proNo, char leader, char inviteYN, String memberId, String memberName,
			String memberPicture, String memberDepartName, String memberMainTask, char memberEmailCertify) {
		this.memberNo = memberNo;
		this.proNo = proNo;
		this.leader = leader;
		this.inviteYN = inviteYN;
		this.memberId = memberId;
		this.memberName = memberName;
		this.memberPicture = memberPicture;
		this.memberDepartName = memberDepartName;
		this.memberMainTask = memberMainTask;
		this.memberEmailCertify = memberEmailCertify;
	}
	public WorkOnMember() {
		super();
		// TODO Auto-generated constructor stub
	}
}
