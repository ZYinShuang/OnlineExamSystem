package com.jereh.entity;

import javax.inject.Named;

import org.springframework.stereotype.Component;

@Component
@Named("StudentAnswer")
public class StudentAnswer {
	private String paperId;
	private String studentId;
	private int problemId;
	private String answer;
	private String isRight;
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

	public int getProblemId() {
		return problemId;
	}
	public void setProblemId(int problemId) {
		this.problemId = problemId;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getIsRight() {
		return isRight;
	}
	public void setIsRight(String isRight) {
		this.isRight = isRight;
	}
	
}
