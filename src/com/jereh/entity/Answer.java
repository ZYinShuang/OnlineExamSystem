package com.jereh.entity;

import javax.inject.Named;

import org.springframework.stereotype.Component;

@Component
@Named("Answer")
public class Answer {

	private int id;
	private int pid;
	private String answer;
	private String remark;
	public Answer(int id, int pid, String answer, String remark) {
		super();
		this.id = id;
		this.pid = pid;
		this.answer = answer;
		this.remark = remark;
	}
	public Answer() {
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
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	@Override
	public String toString() {
		return "Answer [id=" + id + ", pid=" + pid + ", answer=" + answer
				+ ", remark=" + remark + "]";
	}
	
	

	
	
}
