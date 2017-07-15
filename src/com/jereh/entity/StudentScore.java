package com.jereh.entity;

public class StudentScore {
	private String paperId;
	private String studentId;
	private String studentName;
	//private int    problemId;
	//private int    type;
	//private int    score;
	private int    s_score;
	private int    m_score;
	private int    j_score;
	private int    f_score;
	private int    a_score;
	private int	   sum_score;
	
	public int getS_score() {
		return s_score;
	}
	public void setS_score(int s_score) {
		this.s_score = s_score;
	}
	public int getM_score() {
		return m_score;
	}
	public void setM_score(int m_score) {
		this.m_score = m_score;
	}
	public int getJ_score() {
		return j_score;
	}
	public void setJ_score(int j_score) {
		this.j_score = j_score;
	}
	public int getF_score() {
		return f_score;
	}
	public void setF_score(int f_score) {
		this.f_score = f_score;
	}
	public int getA_score() {
		return a_score;
	}
	public void setA_score(int a_score) {
		this.a_score = a_score;
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
	/*public int getProblemId() {
		return problemId;
	}
	public void setProblemId(int problemId) {
		this.problemId = problemId;
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
	}*/
	
	public int getSum_score() {
		return sum_score;
	}
	public void setSum_score(int sum_score) {
		this.sum_score = sum_score;
	}
	
	
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	@Override
	public String toString() {
		return "StudentScore [paperId=" + paperId + ", studentId=" + studentId
				+ ", problemId=" + ", type=" + ", score="
				 + ", s_score=" + s_score + ", m_score=" + m_score
				+ ", j_score=" + j_score + ", f_score=" + f_score
				+ ", a_score=" + a_score + "]";
	}
	
}
