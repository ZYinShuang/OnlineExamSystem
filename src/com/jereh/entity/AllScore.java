package com.jereh.entity;

/**
 * ¼ÆËãÊÔ¾í×Ü·Ö
 * @author Jerehedu
 *
 */
public class AllScore {
	
	private int arrsid;
	private String arrpid;
	private int allscore;
	public AllScore(int arrsid, String arrpid, int allscore) {
		super();
		this.arrsid = arrsid;
		this.arrpid = arrpid;
		this.allscore = allscore;
	}
	public int getArrsid() {
		return arrsid;
	}
	public void setArrsid(int arrsid) {
		this.arrsid = arrsid;
	}
	public String getArrpid() {
		return arrpid;
	}
	public void setArrpid(String arrpid) {
		this.arrpid = arrpid;
	}
	public int getAllscore() {
		return allscore;
	}
	public void setAllscore(int allscore) {
		this.allscore = allscore;
	}
	@Override
	public String toString() {
		return "AllScore [arrsid=" + arrsid + ", arrpid=" + arrpid
				+ ", allscore=" + allscore + "]";
	}
	
	
	

}
