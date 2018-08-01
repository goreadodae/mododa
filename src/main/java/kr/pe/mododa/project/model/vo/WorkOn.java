package kr.pe.mododa.project.model.vo;

public class WorkOn {
	
	private int memberNo;
	private int proNo;
	private String leader;
	private String inviteYN;
	
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
	public String getLeader() {
		return leader;
	}
	public void setLeader(String leader) {
		this.leader = leader;
	}
	public String getInviteYN() {
		return inviteYN;
	}
	public void setInviteYN(String inviteYN) {
		this.inviteYN = inviteYN;
	}
	@Override
	public String toString() {
		return "WorkOn [memberNo=" + memberNo + ", proNo=" + proNo + ", leader=" + leader + ", inviteYN=" + inviteYN
				+ "]";
	}
	public WorkOn(int memberNo, int proNo, String leader, String inviteYN) {
		this.memberNo = memberNo;
		this.proNo = proNo;
		this.leader = leader;
		this.inviteYN = inviteYN;
	}
	public WorkOn() {
		super();
		// TODO Auto-generated constructor stub
	}
}
