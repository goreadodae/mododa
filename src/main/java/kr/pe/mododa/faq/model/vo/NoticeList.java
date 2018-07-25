package kr.pe.mododa.faq.model.vo;

public class NoticeList {
	private int startTotalBoard;
	private int endTotalBoard;
	

	
	public NoticeList() {
		super();
		// TODO Auto-generated constructor stub
	}
	public NoticeList(int startTotalBoard, int endTotalBoard) {
		super();
		this.startTotalBoard = startTotalBoard;
		this.endTotalBoard = endTotalBoard;
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
	


}
