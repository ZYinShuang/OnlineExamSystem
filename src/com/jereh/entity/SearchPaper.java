package com.jereh.entity;

public class SearchPaper {
	private String paperId;
	private int startNumber;
	private int rows;
	public SearchPaper(String paperId, int startNumber, int rows) {
		super();
		this.paperId = paperId;
		this.startNumber = startNumber;
		this.rows = rows;
	}
	public String getPaperId() {
		return paperId;
	}
	public void setPaperId(String paperId) {
		this.paperId = paperId;
	}
	public int getStartNumber() {
		return startNumber;
	}
	public void setStartNumber(int startNumber) {
		this.startNumber = startNumber;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	
	

}
