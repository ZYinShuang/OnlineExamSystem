package com.jereh.entity;

import javax.inject.Named;

import org.springframework.stereotype.Component;

@Component
@Named("PaperCallOption")
public class PaperCallOption {
	private String paperId;
	private int courseId;
	private int courseStage;
	private int pType;
	private int nd_e_number;
	private int nd_m_number;
	private int nd_d_number;
	private int point;
	private String result;
	private String isclass;
	private String name;
	private int state;
	

	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
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
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
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
	public int getpType() {
		return pType;
	}
	public void setpType(int pType) {
		this.pType = pType;
	}
	public int getNd_e_number() {
		return nd_e_number;
	}
	public void setNd_e_number(int nd_e_number) {
		this.nd_e_number = nd_e_number;
	}
	public int getNd_m_number() {
		return nd_m_number;
	}
	public void setNd_m_number(int nd_m_number) {
		this.nd_m_number = nd_m_number;
	}
	public int getNd_d_number() {
		return nd_d_number;
	}
	public void setNd_d_number(int nd_d_number) {
		this.nd_d_number = nd_d_number;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	
}
