package com.jereh.entity;

/**
 * 简答题 详情页面：包含简答题全部信息
 * @author jianghao
 *
 */
public class ShortAnswer {
	
	
	private int id;
	private int cid;
	private int cStage;
	private String course;
	private String title;
	private int type;
	private int nycd;
	private boolean isShow;
	private int anwNum;
	private int aid;
	private String answer;
	private String remark;
	private String nycd_show;
	private String isShow_show;
	private String cStage_show;
	
	
	public ShortAnswer(int id, int cid, int cStage, String course,
			String title, int type, int nycd, boolean isShow, int anwNum,
			int aid, String answer, String remark, String nycd_show,
			String isShow_show,String cStage_show) {
		super();
		this.id = id;
		this.cid = cid;
		this.cStage = cStage;
		this.course = course;
		this.title = title;
		this.type = type;
		this.nycd = nycd;
		this.isShow = isShow;
		this.anwNum = anwNum;
		this.aid = aid;
		this.answer = answer;
		this.remark = remark;
		this.nycd_show = nycd_show;
		this.isShow_show = isShow_show;
		this.cStage_show = cStage_show;
	}
	public ShortAnswer() {
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
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	public String getNycd_show() {
		return nycd_show;
	}
	public void setNycd_show(String nycd_show) {
		this.nycd_show = nycd_show;
	}
	public String getIsShow_show() {
		return isShow_show;
	}
	public void setIsShow_show(String isShow_show) {
		this.isShow_show = isShow_show;
	}
	public int getAid() {
		return aid;
	}
	public void setAid(int aid) {
		this.aid = aid;
	}
	public int getcStage() {
		return cStage;
	}
	public void setcStage(int cStage) {
		this.cStage = cStage;
	}
	public String getcStage_show() {
		return cStage_show;
	}
	public void setcStage_show(String cStage_show) {
		this.cStage_show = cStage_show;
	}
	
	
	@Override
	public String toString() {
		return "ShortAnswer [id=" + id + ", cid=" + cid + ", cStage=" + cStage
				+ ", course=" + course + ", title=" + title + ", type=" + type
				+ ", nycd=" + nycd + ", isShow=" + isShow + ", anwNum="
				+ anwNum + ", aid=" + aid + ", answer=" + answer + ", remark="
				+ remark + ", nycd_show=" + nycd_show + ", isShow_show="
				+ isShow_show + ", cStage_show=" + cStage_show + ", getId()="
				+ getId() + ", getCid()=" + getCid() + ", getTitle()="
				+ getTitle() + ", getType()=" + getType() + ", getNycd()="
				+ getNycd() + ", isShow()=" + isShow() + ", getAnwNum()="
				+ getAnwNum() + ", getAnswer()=" + getAnswer()
				+ ", getRemark()=" + getRemark() + ", getCourse()="
				+ getCourse() + ", getNycd_show()=" + getNycd_show()
				+ ", getIsShow_show()=" + getIsShow_show() + ", getAid()="
				+ getAid() + ", getcStage()=" + getcStage()
				+ ", getcStage_show()=" + getcStage_show() + ", getClass()="
				+ getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	

}
