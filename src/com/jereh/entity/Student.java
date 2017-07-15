package com.jereh.entity;

public class Student {
	private int id;
	private String name;
	private boolean isShow;
	private String isShow_show;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public boolean getIsShow() {
		return isShow;
	}
	public void setisShow(boolean is_show) {
		this.isShow = is_show;
	}
	public String getIsShow_show() {
		return isShow_show;
	}
	public void setIsShow_show(String isShow_show) {
		this.isShow_show = isShow_show;
	}
	public Student(int id, String name, boolean isShow) {
		super();
		this.id = id;
		this.name = name;
		this.isShow = isShow;
	}
	public Student() {
		super();
	}
	
	
	
	
	
	
}
