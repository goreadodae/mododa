package kr.pe.mododa.write.model.vo;

public class PrivateSpace {
	private int proNo;
	private String proTitle;
	private int memberNo;
	private int parNo;
	private String parName;
	private String parYN;
	public PrivateSpace() {
		super();
		
	}
	public PrivateSpace(int proNo, String proTitle, int memberNo, int parNo, String parName, String parYN) {
		super();
		this.proNo = proNo;
		this.proTitle = proTitle;
		this.memberNo = memberNo;
		this.parNo = parNo;
		this.parName = parName;
		this.parYN = parYN;
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
	public String getParYN() {
		return parYN;
	}
	public void setParYN(String parYN) {
		this.parYN = parYN;
	}
	
	
	

}
