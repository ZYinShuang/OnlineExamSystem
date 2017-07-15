
package com.jereh.entity;

public class PaperHead {
	@Override
	public String toString() {
		return "PaperHead [paperId=" + paperId + ", courseId=" + courseId
				+ ", courseStage=" + courseStage + ", subject=" + subject
				+ ", stage=" + stage + ", classId=" + classId + ", paperName="
				+ paperName + ", state=" + state + ", examTime=" + examTime
				+ ", singlePoint=" + singlePoint + ", isclass=" + isclass
				+ ", name=" + name + "]";
	}
	private String paperId;
	private int courseId;
	private int courseStage;
	private String subject;
	private String stage;
	private String isstate;
	
	
	public String getIsstate() {
		return isstate;
	}
	public void setIsstate(String isstate) {
		this.isstate = isstate;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getStage() {
		return stage;
	}
	public void setStage(String stage) {
		this.stage = stage;
	}
	private String classId;
	private String paperName;
	private String state;
	private String examTime;
	private int singlePoint; 
	private int s_eCount;    
	private int s_mCount;    
	private int s_dCount;    
	private int multPoint  ;  
	private int m_eCount   ; 
	private int m_mCount   ; 
	private int m_dCount   ; 
	private int judgePoint ; 
	private int j_eCount   ; 
	private int j_mCount   ; 
	private int j_dCount   ; 
	private int fillPoint  ; 
	private int f_eCount   ; 
	private int f_mCount   ; 
	private int f_dCount   ; 
	private int answerPoint; 
	private int a_eCount   ; 
	private int a_mCount   ; 
	private int a_dCount   ; 
	private String isclass;
	private String name;
	
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIsclass() {
		return isclass;
	}
	public void setIsclass(String isclass) {
		this.isclass = isclass;
	}
	public int getSinglePoint() {
		return singlePoint;
	}
	public void setSinglePoint(int singlePoint) {
		this.singlePoint = singlePoint;
	}
	public int getS_eCount() {
		return s_eCount;
	}
	public void setS_eCount(int s_eCount) {
		this.s_eCount = s_eCount;
	}
	public int getS_mCount() {
		return s_mCount;
	}
	public void setS_mCount(int s_mCount) {
		this.s_mCount = s_mCount;
	}
	public int getS_dCount() {
		return s_dCount;
	}
	public void setS_dCount(int s_dCount) {
		this.s_dCount = s_dCount;
	}
	public int getMultPoint() {
		return multPoint;
	}
	public void setMultPoint(int multPoint) {
		this.multPoint = multPoint;
	}
	public int getM_eCount() {
		return m_eCount;
	}
	public void setM_eCount(int m_eCount) {
		this.m_eCount = m_eCount;
	}
	public int getM_mCount() {
		return m_mCount;
	}
	public void setM_mCount(int m_mCount) {
		this.m_mCount = m_mCount;
	}
	public int getM_dCount() {
		return m_dCount;
	}
	public void setM_dCount(int m_dCount) {
		this.m_dCount = m_dCount;
	}
	public int getJudgePoint() {
		return judgePoint;
	}
	public void setJudgePoint(int judgePoint) {
		this.judgePoint = judgePoint;
	}
	public int getJ_eCount() {
		return j_eCount;
	}
	public void setJ_eCount(int j_eCount) {
		this.j_eCount = j_eCount;
	}
	public int getJ_mCount() {
		return j_mCount;
	}
	public void setJ_mCount(int j_mCount) {
		this.j_mCount = j_mCount;
	}
	public int getJ_dCount() {
		return j_dCount;
	}
	public void setJ_dCount(int j_dCount) {
		this.j_dCount = j_dCount;
	}
	public int getFillPoint() {
		return fillPoint;
	}
	public void setFillPoint(int fillPoint) {
		this.fillPoint = fillPoint;
	}
	public int getF_eCount() {
		return f_eCount;
	}
	public void setF_eCount(int f_eCount) {
		this.f_eCount = f_eCount;
	}
	public int getF_mCount() {
		return f_mCount;
	}
	public void setF_mCount(int f_mCount) {
		this.f_mCount = f_mCount;
	}
	public int getF_dCount() {
		return f_dCount;
	}
	public void setF_dCount(int f_dCount) {
		this.f_dCount = f_dCount;
	}
	public int getAnswerPoint() {
		return answerPoint;
	}
	public void setAnswerPoint(int answerPoint) {
		this.answerPoint = answerPoint;
	}
	public int getA_eCount() {
		return a_eCount;
	}
	public void setA_eCount(int a_eCount) {
		this.a_eCount = a_eCount;
	}
	public int getA_mCount() {
		return a_mCount;
	}
	public void setA_mCount(int a_mCount) {
		this.a_mCount = a_mCount;
	}
	public int getA_dCount() {
		return a_dCount;
	}
	public void setA_dCount(int a_dCount) {
		this.a_dCount = a_dCount;
	}
	public String getPaperId() {
		return paperId;
	}
	public void setPaperId(String paperId) {
		this.paperId = paperId;
	}
	public int getCourseId() {
		return courseId;
	}
	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}
	public int getCourseStage() {
		return courseStage;
	}
	public void setCourseStage(int courseStage) {
		this.courseStage = courseStage;
	}
	public String getClassId() {
		return classId;
	}
	public void setClassId(String classId) {
		this.classId = classId;
	}
	public String getPaperName() {
		return paperName;
	}
	public void setPaperName(String paperName) {
		this.paperName = paperName;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getExamTime() {
		return examTime;
	}
	public void setExamTime(String examTime) {
		this.examTime = examTime;
	}

	
	

}
