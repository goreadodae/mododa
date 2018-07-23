package kr.pe.mododa.library.model.vo;

import java.sql.Date;

public class Todo {
	private int todoNo;
	private int todoPostNo;
	private int todoProNo;
	private String todoTitle;
	private String todoContent;
	private int todoWriter;
	private int todoMember;
	private Date todoStartDate;
	private Date todoEndDate;
	private String todoProgress;
	
	public Todo() { }
	
	public Todo(int todoNo, int todoPostNo, int todoProNo, String todoTitle, String todoContent, int todoWriter,
			int todoMember, Date todoStartDate, Date todoEndDate, String todoProgress) {
		super();
		this.todoNo = todoNo;
		this.todoPostNo = todoPostNo;
		this.todoProNo = todoProNo;
		this.todoTitle = todoTitle;
		this.todoContent = todoContent;
		this.todoWriter = todoWriter;
		this.todoMember = todoMember;
		this.todoStartDate = todoStartDate;
		this.todoEndDate = todoEndDate;
		this.todoProgress = todoProgress;
	}
	
	public int getTodoNo() {
		return todoNo;
	}
	public void setTodoNo(int todoNo) {
		this.todoNo = todoNo;
	}
	public int getTodoPostNo() {
		return todoPostNo;
	}
	public void setTodoPostNo(int todoPostNo) {
		this.todoPostNo = todoPostNo;
	}
	public int getTodoProNo() {
		return todoProNo;
	}
	public void setTodoProNo(int todoProNo) {
		this.todoProNo = todoProNo;
	}
	public String getTodoTitle() {
		return todoTitle;
	}
	public void setTodoTitle(String todoTitle) {
		this.todoTitle = todoTitle;
	}
	public String getTodoContent() {
		return todoContent;
	}
	public void setTodoContent(String todoContent) {
		this.todoContent = todoContent;
	}
	public int getTodoWriter() {
		return todoWriter;
	}
	public void setTodoWriter(int todoWriter) {
		this.todoWriter = todoWriter;
	}
	public int getTodoMember() {
		return todoMember;
	}
	public void setTodoMember(int todoMember) {
		this.todoMember = todoMember;
	}
	public Date getTodoStartDate() {
		return todoStartDate;
	}
	public void setTodoStartDate(Date todoStartDate) {
		this.todoStartDate = todoStartDate;
	}
	public Date getTodoEndDate() {
		return todoEndDate;
	}
	public void setTodoEndDate(Date todoEndDate) {
		this.todoEndDate = todoEndDate;
	}
	public String getTodoProgress() {
		return todoProgress;
	}
	public void setTodoProgress(String todoProgress) {
		this.todoProgress = todoProgress;
	}
	
	

}