package kr.pe.mododa.qna.model.vo;

public class QnaList {
	private int startTotalBoard;
	private int endTotalBoard;
	private int memberNo;
	
	public QnaList() {
		super();
		// TODO Auto-generated constructor stub
	}
	public QnaList(int startTotalBoard, int endTotalBoard, int memberNo) {
		super();
		this.startTotalBoard = startTotalBoard;
		this.endTotalBoard = endTotalBoard;
		this.memberNo = memberNo;
	}
	public int getStartTotalBoard() {
		return startTotalBoard;
	}
	public void setStartTotalBoard(int startTotalBoard) {
		this.startTotalBoard = startTotalBoard;
	}
	public int getEndTotalBoard() {
		return endTotalBoard;
	}
	public void setEndTotalBoard(int endTotalBoard) {
		this.endTotalBoard = endTotalBoard;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	
	
	
	
	
}
