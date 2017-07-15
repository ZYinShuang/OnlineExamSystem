package com.jereh.entity;

public class TJscore {
	private int fileScore;
	private int shortScore;
	private String paperId;
	private String studentId;
	private int socre;
	private int type;
	public TJscore(int fileScore, int shortScore, String paperId,
			String studentId) {
		super();
		this.fileScore = fileScore;
		this.shortScore = shortScore;
		this.paperId = paperId;
		this.studentId = studentId;
	}
	public int getFileScore() {
		return fileScore;
	}
	public void setFileScore(int fileScore) {
		this.fileScore = fileScore;
	}
	public int getShortScore() {
		return shortScore;
	}
	public void setShortScore(int shortScore) {
		this.shortScore = shortScore;
	}
	public String getPaperId() {
		return paperId;
	}
	public void setPaperId(String paperId) {
		this.paperId = paperId;
	}
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	public int getSocre() {
		return socre;
	}
	public void setSocre(int socre) {
		this.socre = socre;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public TJscore(String paperId, String studentId, int socre, int type) {
		super();
		this.paperId = paperId;
		this.studentId = studentId;
		this.socre = socre;
		this.type = type;
	}


	

}
