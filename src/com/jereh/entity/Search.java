package com.jereh.entity;

public class Search {

	//<!-- s_course, s_cStage, s_title, s_nycd, s_isShow -->
	private int cid;
	private int cStage;
	private String title;
	private int nycd;
	private int isShow;
	private int startNum;
	private int rows;
	private int type;
	//”√ªß
	private String sUserName;
	private int sType;
	private String sName;
	private int sIs_show;
	private String isclass;
	
	
	
	public Search(int startNum,int rows, String sUserName, int sType, String sName,
			int sIs_show,String isclass) {
		super();
		this.startNum = startNum;
		this.rows = rows;
		this.sUserName = sUserName;
		this.sType = sType;
		this.sName = sName;
		this.sIs_show = sIs_show;
		this.isclass = isclass;
	}
	public Search(int cid, int cStage, String title, int nycd, int isShow,
			int startNum, int rows, int type) {
		super();
		this.cid = cid;
		this.cStage = cStage;
		this.title = title;
		this.nycd = nycd;
		this.isShow = isShow;
		this.startNum = startNum;
		this.rows = rows;
		this.type = type;
	}
	public Search(int cid, int cStage, String title, int nycd, int isShow,
			int startNum, int rows) {
		super();
		this.cid = cid;
		this.cStage = cStage;
		this.title = title;
		this.nycd = nycd;
		this.isShow = isShow;
		this.startNum = startNum;
		this.rows = rows;
	}
	public Search() {
		super();
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getcStage() {
		return cStage;
	}
	public void setcStage(int cStage) {
		this.cStage = cStage;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getNycd() {
		return nycd;
	}
	public void setNycd(int nycd) {
		this.nycd = nycd;
	}
	public int getIsShow() {
		return isShow;
	}
	public void setIsShow(int isShow) {
		this.isShow = isShow;
	}
	public int getStartNum() {
		return startNum;
	}
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	
	
	
	public String getsUserName() {
		return sUserName;
	}
	public void setsUserName(String sUserName) {
		this.sUserName = sUserName;
	}
	public int getsType() {
		return sType;
	}
	public void setsType(int sType) {
		this.sType = sType;
	}
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
	}
	public int getsIs_show() {
		return sIs_show;
	}
	public void setsIs_show(int sIs_show) {
		this.sIs_show = sIs_show;
	}
	
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	@Override
	public String toString() {
		return "Search [cid=" + cid + ", cStage=" + cStage + ", title=" + title
				+ ", nycd=" + nycd + ", isShow=" + isShow + ", startNum="
				+ startNum + ", rows=" + rows + ", Type=" + type + "]";
	}
	public String getIsclass() {
		return isclass;
	}
	public void setIsclass(String isclass) {
		this.isclass = isclass;
	}
	public Search(String sUserName, int sType, String sName, int sIs_show,
			String isclass) {
		super();
		this.sUserName = sUserName;
		this.sType = sType;
		this.sName = sName;
		this.sIs_show = sIs_show;
		this.isclass = isclass;
	}
	
	
	
	
	
	
}
