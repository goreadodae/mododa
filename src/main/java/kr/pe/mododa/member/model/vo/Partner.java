package kr.pe.mododa.member.model.vo;

public class Partner {
	private int memberNo;
	private String parExplain;
	private char parYN;
	private int parNo;
	private String parId;
	private String parName;
	private String parPicture;
	private String parDepartName;
	private String parMainTask;
	public Partner() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Partner(int memberNo, String parExplain, char parYN, int parNo, String parId, String parName,
			String parPicture, String parDepartName, String parMainTask) {
		this.memberNo = memberNo;
		this.parExplain = parExplain;
		this.parYN = parYN;
		this.parNo = parNo;
		this.parId = parId;
		this.parName = parName;
		this.parPicture = parPicture;
		this.parDepartName = parDepartName;
		this.parMainTask = parMainTask;
	}
	@Override
	public String toString() {
		return "Partner [memberNo=" + memberNo + ", parExplain=" + parExplain + ", parYN=" + parYN + ", parNo=" + parNo
				+ ", parId=" + parId + ", parName=" + parName + ", parPicture=" + parPicture + ", parDepartName="
				+ parDepartName + ", parMainTask=" + parMainTask + "]";
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getParExplain() {
		return parExplain;
	}
	public void setParExplain(String parExplain) {
		this.parExplain = parExplain;
	}
	public char getParYN() {
		return parYN;
	}
	public void setParYN(char parYN) {
		this.parYN = parYN;
	}
	public int getParNo() {
		return parNo;
	}
	public void setParNo(int parNo) {
		this.parNo = parNo;
	}
	public String getParId() {
		return parId;
	}
	public void setParId(String parId) {
		this.parId = parId;
	}
	public String getParName() {
		return parName;
	}
	public void setParName(String parName) {
		this.parName = parName;
	}
	public String getParPicture() {
		return parPicture;
	}
	public void setParPicture(String parPicture) {
		this.parPicture = parPicture;
	}
	public String getParDepartName() {
		return parDepartName;
	}
	public void setParDepartName(String parDepartName) {
		this.parDepartName = parDepartName;
	}
	public String getParMainTask() {
		return parMainTask;
	}
	public void setParMainTask(String parMainTask) {
		this.parMainTask = parMainTask;
	}
	
}
