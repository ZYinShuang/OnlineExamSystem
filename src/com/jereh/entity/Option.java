package com.jereh.entity;

import javax.inject.Named;

import org.springframework.stereotype.Component;

/**
 * 单选复选题，选项&答案类
 * 
 * option 选项
 * isAnw 是否是正确答案
 * 
 * @author jianghao
 *
 */
@Component
@Named("Selection")
public class Option {
	
	private int id;
	private int pid;
	private String option;
	private boolean isAnw;
	public Option(int id, int pid, String option, boolean isAnw) {
		super();
		this.id = id;
		this.pid = pid;
		this.option = option;
		this.isAnw = isAnw;
	}
	public Option() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getOption() {
		return option;
	}
	public void setOption(String option) {
		this.option = option;
	}
	public boolean isAnw() {
		return isAnw;
	}
	public void setAnw(boolean isAnw) {
		this.isAnw = isAnw;
	}
	@Override
	public String toString() {
		return "Option [id=" + id + ", pid=" + pid + ", option=" + option
				+ ", isAnw=" + isAnw + "]";
	}
	
	
	

	
}
