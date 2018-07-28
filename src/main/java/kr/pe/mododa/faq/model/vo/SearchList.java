package kr.pe.mododa.faq.model.vo;

public class SearchList {
	private int startTotalBoard;
	private int endTotalBoard;
	private String option;
	private String search;
	
	public SearchList() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SearchList(int startTotalBoard, int endTotalBoard, String option, String search) {
		super();
		this.startTotalBoard = startTotalBoard;
		this.endTotalBoard = endTotalBoard;
		this.option = option;
		this.search = search;
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
	public String getOption() {
		return option;
	}
	public void setOption(String option) {
		this.option = option;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	
	
	
}
