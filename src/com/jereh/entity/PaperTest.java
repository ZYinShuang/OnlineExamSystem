package com.jereh.entity;

import java.io.Serializable;

public class PaperTest implements Serializable {
	private int type;
	private String title;
	private String item;
	private int ct;
	private String sAnswer;
	private String rAnswer;
	private int mark;
	private int pid;
	public String getsAnswer() {
		return sAnswer;
	}
	public void setsAnswer(String sAnswer) {
		this.sAnswer = sAnswer;
	}
	public String getrAnswer() {
		return rAnswer;
	}
	public void setrAnswer(String rAnswer) {
		this.rAnswer = rAnswer;
	}
	public int getCt() {
		return ct;
	}
	public void setCt(int ct) {
		this.ct = ct;
	}

	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
	}
	public int getMark() {
		return mark;
	}
	public void setMark(int mark) {
		this.mark = mark;
	}
}
