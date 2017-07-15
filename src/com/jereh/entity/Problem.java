package com.jereh.entity;

import javax.inject.Named;

import org.springframework.stereotype.Component;

/**
 * 题干类
 * 
 * type 类型：1-单选/2-多选/3-判断/4-填空/5-简答
 * 
 * @author jianghao
 *
 */
@Component
@Named("Problem")
public class Problem {

	private int id;
	private int cid;
	private int cStage;
	private String title;
	private int type;
	private int nycd;
	private boolean isShow;
	private int anwNum;
	
	
	
	public Problem(int id, int cid, int cStage, String title, int type,
			int nycd, boolean isShow, int anwNum) {
		super();
		this.id = id;
		this.cid = cid;
		this.cStage = cStage;
		this.title = title;
		this.type = type;
		this.nycd = nycd;
		this.isShow = isShow;
		this.anwNum = anwNum;
	}
	public Problem() {
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getNycd() {
		return nycd;
	}
	public void setNycd(int nycd) {
		this.nycd = nycd;
	}
	public boolean isShow() {
		return isShow;
	}
	public void setShow(boolean isShow) {
		this.isShow = isShow;
	}
	public int getAnwNum() {
		return anwNum;
	}
	public void setAnwNum(int anwNum) {
		this.anwNum = anwNum;
	}
	public int getcStage() {
		return cStage;
	}
	public void setcStage(int cStage) {
		this.cStage = cStage;
	}
	@Override
	public String toString() {
		return "Problem [id=" + id + ", cid=" + cid + ", cStage=" + cStage
				+ ", title=" + title + ", type=" + type + ", nycd=" + nycd
				+ ", isShow=" + isShow + ", anwNum=" + anwNum + "]";
	}
	
	
	

	
}
