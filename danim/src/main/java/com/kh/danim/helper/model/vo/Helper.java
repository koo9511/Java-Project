package com.kh.danim.helper.model.vo;

public class Helper implements java.io.Serializable{

	
	private static final long serialVersionUID = -4107471834300597885L;
	
	private int helperno;				//헬퍼번호
	private String helpernickname;		//헬퍼닉네임
	private String helperid;			//헬퍼아이디
	private String helperphone;			//헬퍼전화번호
	private String helpertitle;			//헬퍼제목
	private String helpercontents;		//헬퍼내용
	private String helperregisttime;	//헬퍼등록시간
	private String helperregistdate;	//헬퍼등록날짜
	private String helperpay;			//심부름가격
	private String helperpaym;			//심부름매칭방식
	private String helpercate;			//등록카테고리
	private String helperloc;			//헬퍼지역
	private String helperimage;			//본래이미지이름
	private String helperrenameimage;	//리네임처리된이미지이름
	
	
	private String helpercount;			//헬퍼횟수
	private String helperreview;		//헬퍼점수
	
	
	private int cleaningnum;
	private int deliverynum;
	private int shoppingnum;
	private int keepingnum;
	private int lineupnum;
	private int carenum;
	private int cosplaynum;
	private int professionalnum;
	private int movingnum;
	
	public Helper() {}

	public Helper(int helperno, String helpernickname, String helperid, String helperphone, String helpertitle,
			String helpercontents, String helperregisttime, String helperregistdate, String helperpay,
			String helperpaym, String helpercate, String helperloc, String helperimage, String helperrenameimage,
			String helpercount, String helperreview, int cleaningnum, int deliverynum, int shoppingnum, int keepingnum,
			int lineupnum, int carenum, int cosplaynum, int professionalnum, int movingnum) {
		super();
		this.helperno = helperno;
		this.helpernickname = helpernickname;
		this.helperid = helperid;
		this.helperphone = helperphone;
		this.helpertitle = helpertitle;
		this.helpercontents = helpercontents;
		this.helperregisttime = helperregisttime;
		this.helperregistdate = helperregistdate;
		this.helperpay = helperpay;
		this.helperpaym = helperpaym;
		this.helpercate = helpercate;
		this.helperloc = helperloc;
		this.helperimage = helperimage;
		this.helperrenameimage = helperrenameimage;
		this.helpercount = helpercount;
		this.helperreview = helperreview;
		this.cleaningnum = cleaningnum;
		this.deliverynum = deliverynum;
		this.shoppingnum = shoppingnum;
		this.keepingnum = keepingnum;
		this.lineupnum = lineupnum;
		this.carenum = carenum;
		this.cosplaynum = cosplaynum;
		this.professionalnum = professionalnum;
		this.movingnum = movingnum;
	}

	public int getHelperno() {
		return helperno;
	}

	public void setHelperno(int helperno) {
		this.helperno = helperno;
	}

	public String getHelpernickname() {
		return helpernickname;
	}

	public void setHelpernickname(String helpernickname) {
		this.helpernickname = helpernickname;
	}

	public String getHelperid() {
		return helperid;
	}

	public void setHelperid(String helperid) {
		this.helperid = helperid;
	}

	public String getHelperphone() {
		return helperphone;
	}

	public void setHelperphone(String helperphone) {
		this.helperphone = helperphone;
	}

	public String getHelpertitle() {
		return helpertitle;
	}

	public void setHelpertitle(String helpertitle) {
		this.helpertitle = helpertitle;
	}

	public String getHelpercontents() {
		return helpercontents;
	}

	public void setHelpercontents(String helpercontents) {
		this.helpercontents = helpercontents;
	}

	public String getHelperregisttime() {
		return helperregisttime;
	}

	public void setHelperregisttime(String helperregisttime) {
		this.helperregisttime = helperregisttime;
	}

	public String getHelperregistdate() {
		return helperregistdate;
	}

	public void setHelperregistdate(String helperregistdate) {
		this.helperregistdate = helperregistdate;
	}

	public String getHelperpay() {
		return helperpay;
	}

	public void setHelperpay(String helperpay) {
		this.helperpay = helperpay;
	}

	public String getHelperpaym() {
		return helperpaym;
	}

	public void setHelperpaym(String helperpaym) {
		this.helperpaym = helperpaym;
	}

	public String getHelpercate() {
		return helpercate;
	}

	public void setHelpercate(String helpercate) {
		this.helpercate = helpercate;
	}

	public String getHelperloc() {
		return helperloc;
	}

	public void setHelperloc(String helperloc) {
		this.helperloc = helperloc;
	}

	public String getHelperimage() {
		return helperimage;
	}

	public void setHelperimage(String helperimage) {
		this.helperimage = helperimage;
	}

	public String getHelperrenameimage() {
		return helperrenameimage;
	}

	public void setHelperrenameimage(String helperrenameimage) {
		this.helperrenameimage = helperrenameimage;
	}

	public String getHelpercount() {
		return helpercount;
	}

	public void setHelpercount(String helpercount) {
		this.helpercount = helpercount;
	}

	public String getHelperreview() {
		return helperreview;
	}

	public void setHelperreview(String helperreview) {
		this.helperreview = helperreview;
	}

	public int getCleaningnum() {
		return cleaningnum;
	}

	public void setCleaningnum(int cleaningnum) {
		this.cleaningnum = cleaningnum;
	}

	public int getDeliverynum() {
		return deliverynum;
	}

	public void setDeliverynum(int deliverynum) {
		this.deliverynum = deliverynum;
	}

	public int getShoppingnum() {
		return shoppingnum;
	}

	public void setShoppingnum(int shoppingnum) {
		this.shoppingnum = shoppingnum;
	}

	public int getKeepingnum() {
		return keepingnum;
	}

	public void setKeepingnum(int keepingnum) {
		this.keepingnum = keepingnum;
	}

	public int getLineupnum() {
		return lineupnum;
	}

	public void setLineupnum(int lineupnum) {
		this.lineupnum = lineupnum;
	}

	public int getCarenum() {
		return carenum;
	}

	public void setCarenum(int carenum) {
		this.carenum = carenum;
	}

	public int getCosplaynum() {
		return cosplaynum;
	}

	public void setCosplaynum(int cosplaynum) {
		this.cosplaynum = cosplaynum;
	}

	public int getProfessionalnum() {
		return professionalnum;
	}

	public void setProfessionalnum(int professionalnum) {
		this.professionalnum = professionalnum;
	}

	public int getMovingnum() {
		return movingnum;
	}

	public void setMovingnum(int movingnum) {
		this.movingnum = movingnum;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Helper [helperno=" + helperno + ", helpernickname=" + helpernickname + ", helperid=" + helperid
				+ ", helperphone=" + helperphone + ", helpertitle=" + helpertitle + ", helpercontents=" + helpercontents
				+ ", helperregisttime=" + helperregisttime + ", helperregistdate=" + helperregistdate + ", helperpay="
				+ helperpay + ", helperpaym=" + helperpaym + ", helpercate=" + helpercate + ", helperloc=" + helperloc
				+ ", helperimage=" + helperimage + ", helperrenameimage=" + helperrenameimage + ", helpercount="
				+ helpercount + ", helperreview=" + helperreview + ", cleaningnum=" + cleaningnum + ", deliverynum="
				+ deliverynum + ", shoppingnum=" + shoppingnum + ", keepingnum=" + keepingnum + ", lineupnum="
				+ lineupnum + ", carenum=" + carenum + ", cosplaynum=" + cosplaynum + ", professionalnum="
				+ professionalnum + ", movingnum=" + movingnum + "]";
	}

	
}
