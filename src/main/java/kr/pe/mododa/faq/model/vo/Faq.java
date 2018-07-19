package kr.pe.mododa.faq.model.vo;

import java.sql.Timestamp;

public class Faq {
	private int faqNo;
	private String faqName;
	private String faqContents;
	private String faqWriter;
	private Timestamp faqWriteDate;
	private int faqViewCount;
	

	public Faq() {
		super();
	}
	public Faq(int faqNo, String faqName, String faqContents, String faqWriter, Timestamp faqWriteDate,
			int faqViewCount) {
		super();
		this.faqNo = faqNo;
		this.faqName = faqName;
		this.faqContents = faqContents;
		this.faqWriter = faqWriter;
		this.faqWriteDate = faqWriteDate;
		this.faqViewCount = faqViewCount;
	}
	public int getFaqNo() {
		return faqNo;
	}
	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}
	public String getFaqName() {
		return faqName;
	}
	public void setFaqName(String faqName) {
		this.faqName = faqName;
	}
	public String getFaqContents() {
		return faqContents;
	}
	public void setFaqContents(String faqContents) {
		this.faqContents = faqContents;
	}
	public String getFaqWriter() {
		return faqWriter;
	}
	public void setFaqWriter(String faqWriter) {
		this.faqWriter = faqWriter;
	}
	public Timestamp getFaqWriteDate() {
		return faqWriteDate;
	}
	public void setFaqWriteDate(Timestamp faqWriteDate) {
		this.faqWriteDate = faqWriteDate;
	}
	public int getFaqViewCount() {
		return faqViewCount;
	}
	public void setFaqViewCount(int faqViewCount) {
		this.faqViewCount = faqViewCount;
	}
	
	
}
