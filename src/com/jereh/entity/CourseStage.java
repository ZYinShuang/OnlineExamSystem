package com.jereh.entity;

public class CourseStage {

	private int id;
	private int cid;
	private String stage;
	private boolean isShow;
	public CourseStage(int id, int cid, String stage, boolean isShow) {
		super();
		this.id = id;
		this.cid = cid;
		this.stage = stage;
		this.isShow = isShow;
	}
	public CourseStage() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getStage() {
		return stage;
	}
	public void setStage(String stage) {
		this.stage = stage;
	}
	public boolean isShow() {
		return isShow;
	}
	public void setShow(boolean isShow) {
		this.isShow = isShow;
	}
	
	
	
	

	
}
