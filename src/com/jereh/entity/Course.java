package com.jereh.entity;

/**
 * øŒ≥Ã¿‡
 * @author jianghao
 *
 */
public class Course {

	private int id;
	private String course;
	private boolean isShow;
	private String isShow_show;
	
	
	public Course(int id, String course, boolean isShow, String isShow_show) {
		super();
		this.id = id;
		this.course = course;
		this.isShow = isShow;
		this.isShow_show = isShow_show;
	}
	public Course(int id, String course, boolean isShow) {
		super();
		this.id = id;
		this.course = course;
		this.isShow = isShow;
	}
	public Course() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	public boolean isShow() {
		return isShow;
	}
	public void setShow(boolean isShow) {
		this.isShow = isShow;
	}
	public String getIsShow_show() {
		return isShow_show;
	}
	public void setIsShow_show(String isShow_show) {
		this.isShow_show = isShow_show;
	}
	@Override
	public String toString() {
		return "Course [id=" + id + ", course=" + course + ", isShow=" + isShow
				+ ", isShow_show=" + isShow_show + "]";
	}
	
	
	

	
}
