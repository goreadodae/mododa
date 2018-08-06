package kr.pe.mododa.write.model.vo;

public class Partners {
	private int memberNo;
	private int parNo;
	private String parName;
	private String parExplain;
	private String parYN;
	private String memberPicture;
	
	public Partners() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Partners(int memberNo, int parNo, String parName, String parExplain, String parYN, String memberPicture) {
		super();
		this.memberNo = memberNo;

		this.parNo = parNo;
		this.parName = parName;
		this.parExplain = parExplain;
		this.parYN = parYN;
		this.memberPicture=memberPicture;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getParNo() {
		return parNo;
	}
	public void setParNo(int parNo) {
		this.parNo = parNo;
	}
	public String getParName() {
		return parName;
	}
	public void setParName(String parName) {
		this.parName = parName;
	}
	public String getParExplain() {
		return parExplain;
	}
	public void setParExplain(String parExplain) {
		this.parExplain = parExplain;
	}
	public String getParYN() {
		return parYN;
	}
	public void setParYN(String parYN) {
		this.parYN = parYN;
	}
	public String getMemberPicture() {
		return memberPicture;
	}
	public void setMemberPicture(String memberPicture) {
		this.memberPicture = memberPicture;
	}
	
	
	
	
	
}
