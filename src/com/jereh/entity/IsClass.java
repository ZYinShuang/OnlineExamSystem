package com.jereh.entity;

public class IsClass {
	
	private int from;
	private int rows;
	private String isclass;
	private String teacher;
	private int type;
	private String name;
	private String state;
	
	public IsClass(int from, int rows, String isclass, String teacher,int type) {
		super();
		this.from = from;
		this.rows = rows;
		this.isclass = isclass;
		this.teacher = teacher;
		this.type = type;
	}
	
	
	public String getState() {
		return state;
	}


	public void setState(String state) {
		this.state = state;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public int getType() {
		return type;
	}


	public void setType(int type) {
		this.type = type;
	}


	public String getTeacher() {
		return teacher;
	}
	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}
	public int getFrom() {
		return from;
	}
	public void setFrom(int from) {
		this.from = from;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public String getIsclass() {
		return isclass;
	}
	public void setIsclass(String isclass) {
		this.isclass = isclass;
	}
	public IsClass(int from, int rows,int type,String name) {
		super();
		this.from = from;
		this.rows = rows;
		this.type = type;
		this.name = name;
	}
	
	

}
