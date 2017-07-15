package com.jereh.entity;


public class Score {

 private String paperId;
 private String studentId;
 private int type;
 private int score;
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
public int getType() {
	return type;
}
public void setType(int type) {
	this.type = type;
}
public int getScore() {
	return score;
}
public void setScore(int score) {
	this.score = score;
}
public Score(String paperId, String studentId, int type, int score) {
	super();
	this.paperId = paperId;
	this.studentId = studentId;
	this.type = type;
	this.score = score;
}
public Score() {
	super();
}
@Override
public String toString() {
	return "Score [paperId=" + paperId + ", studentId=" + studentId + ", type="
			+ type + ", score=" + score + "]";
}


 
 
}
