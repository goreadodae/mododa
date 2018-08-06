package kr.pe.mododa.write.model.vo;

public class ProjectMember {
	private int memberNo; 
	private int proNo;
	private String leader;
	private String inviteYN;
	private String memberName;
	private String memberPicture;
	private String proTitle;
	
	public ProjectMember() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProjectMember(int memberNo, int proNo, String leader, String inviteYN, String memberName,
			String memberPicture,String proTitle) {
		super();
		this.memberNo = memberNo;
		this.proNo = proNo;
		this.leader = leader;
		this.inviteYN = inviteYN;
		this.memberName = memberName;
		this.memberPicture = memberPicture;
		
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
	public String getProTitle() {
		return proTitle;
	}
	public void setProTitle(String proTitle) {
		this.proTitle = proTitle;
	}
	
	

}
