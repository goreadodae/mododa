package kr.pe.mododa.member.model.vo;

public class SearchPartner {
	private int memberNo;
	private String searchPartnerText;
	public SearchPartner() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SearchPartner(int memberNo, String searchPartnerText) {
		this.memberNo = memberNo;
		this.searchPartnerText = searchPartnerText;
	}
	@Override
	public String toString() {
		return "SearchPartner [memberNo=" + memberNo + ", searchPartnerText=" + searchPartnerText + "]";
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getSearchPartnerText() {
		return searchPartnerText;
	}
	public void setSearchPartnerText(String searchPartnerText) {
		this.searchPartnerText = searchPartnerText;
	}
	
}
