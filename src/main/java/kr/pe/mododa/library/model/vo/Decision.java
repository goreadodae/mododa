package kr.pe.mododa.library.model.vo;

import java.sql.Date;

public class Decision {
	private int dcNo;
	private int dcPostNo;
	private int dcWriter;
	private int dcMaker;
	private String dcContent;
	private Date dcDate;
	private char dcYn;
	private char dcDecision;
	private String dcComment;
	private Date dcConfirmDate;
	private String dcPostTitle;
	private String dcWriterName;
	private String dcMakerName;
	public Decision() { }
	public Decision(int dcNo, int dcPostNo, int dcWriter, int dcMaker, String dcContent, Date dcDate, char dcYn,
			char dcDecision, String dcComment, Date dcConfirmDate, String dcPostTitle, String dcWriterName,
			String dcMakerName) {
		super();
		this.dcNo = dcNo;
		this.dcPostNo = dcPostNo;
		this.dcWriter = dcWriter;
		this.dcMaker = dcMaker;
		this.dcContent = dcContent;
		this.dcDate = dcDate;
		this.dcYn = dcYn;
		this.dcDecision = dcDecision;
		this.dcComment = dcComment;
		this.dcConfirmDate = dcConfirmDate;
		this.dcPostTitle = dcPostTitle;
		this.dcWriterName = dcWriterName;
		this.dcMakerName = dcMakerName;
	}
	public int getDcNo() {
		return dcNo;
	}
	public void setDcNo(int dcNo) {
		this.dcNo = dcNo;
	}
	public int getDcPostNo() {
		return dcPostNo;
	}
	public void setDcPostNo(int dcPostNo) {
		this.dcPostNo = dcPostNo;
	}
	public int getDcWriter() {
		return dcWriter;
	}
	public void setDcWriter(int dcWriter) {
		this.dcWriter = dcWriter;
	}
	public int getDcMaker() {
		return dcMaker;
	}
	public void setDcMaker(int dcMaker) {
		this.dcMaker = dcMaker;
	}
	public String getDcContent() {
		return dcContent;
	}
	public void setDcContent(String dcContent) {
		this.dcContent = dcContent;
	}
	public Date getDcDate() {
		return dcDate;
	}
	public void setDcDate(Date dcDate) {
		this.dcDate = dcDate;
	}
	public char getDcYn() {
		return dcYn;
	}
	public void setDcYn(char dcYn) {
		this.dcYn = dcYn;
	}
	public char getDcDecision() {
		return dcDecision;
	}
	public void setDcDecision(char dcDecision) {
		this.dcDecision = dcDecision;
	}
	public String getDcComment() {
		return dcComment;
	}
	public void setDcComment(String dcComment) {
		this.dcComment = dcComment;
	}
	public Date getDcConfirmDate() {
		return dcConfirmDate;
	}
	public void setDcConfirmDate(Date dcConfirmDate) {
		this.dcConfirmDate = dcConfirmDate;
	}
	public String getDcPostTitle() {
		return dcPostTitle;
	}
	public void setDcPostTitle(String dcPostTitle) {
		this.dcPostTitle = dcPostTitle;
	}
	public String getDcWriterName() {
		return dcWriterName;
	}
	public void setDcWriterName(String dcWriterName) {
		this.dcWriterName = dcWriterName;
	}
	public String getDcMakerName() {
		return dcMakerName;
	}
	public void setDcMakerName(String dcMakerName) {
		this.dcMakerName = dcMakerName;
	}
	
	
	
	
}
