package com.kh.danim.help.model.vo;

import java.sql.Date;

public class Help implements java.io.Serializable{

	private static final long serialVersionUID = -1241421509734867052L;

	private int helpno;
	private String helpid;
	private String helperid;
	private String roadaddress;
	private String detailaddress;
	private String locationcodelat;
	private String locationcodelng;
	private String locgroup;
	private String targetroadaddress;
	private String targetdetailaddress;
	private String time;
	private Date helpdate;
	private String endtime;
	private String reserdate;
	private String resertime;
	private String usingtime;
	private String helptitle;
	private String contents;
	private String matching;
	private String cancelstatus;
	private String matchingstatus;
	private String pay;
	private String paym;
	private String status;
	private String category;
	private String helperlist;
	private String image;
	private String renameimage;
	
	
	//게시글작성자 정보
	private String phone;
	private String nickname;
	private String danimcount;
	private int review;
	
	//매칭자 정보
	private String helpername;
	private String helperphone;
	private String helperdanimcount;
	private int helperreview;
	
	
	
	private double dis;
	
	private int cleaningnum;
	private int deliverynum;
	private int shoppingnum;
	private int keepingnum;
	private int lineupnum;
	private int carenum;
	private int cosplaynum;
	private int professionalnum;
	private int movingnum;
	
	public Help() {}

	public Help(int helpno, String helpid, String helperid, String roadaddress, String detailaddress,
			String locationcodelat, String locationcodelng, String locgroup, String targetroadaddress,
			String targetdetailaddress, String time, Date helpdate, String endtime, String reserdate, String resertime,
			String usingtime, String helptitle, String contents, String matching, String cancelstatus, String matchingstatus, String pay,
			String paym, String status, String category, String helperlist, String image, String renameimage,
			String phone, String nickname, String danimcount, int review, String helpername, String helperphone,
			String helperdanimcount, int helperreview, double dis, int cleaningnum, int deliverynum, int shoppingnum,
			int keepingnum, int lineupnum, int carenum, int cosplaynum, int professionalnum, int movingnum) {
		super();
		this.helpno = helpno;
		this.helpid = helpid;
		this.helperid = helperid;
		this.roadaddress = roadaddress;
		this.detailaddress = detailaddress;
		this.locationcodelat = locationcodelat;
		this.locationcodelng = locationcodelng;
		this.locgroup = locgroup;
		this.targetroadaddress = targetroadaddress;
		this.targetdetailaddress = targetdetailaddress;
		this.time = time;
		this.helpdate = helpdate;
		this.endtime = endtime;
		this.reserdate = reserdate;
		this.resertime = resertime;
		this.usingtime = usingtime;
		this.helptitle = helptitle;
		this.contents = contents;
		this.matching = matching;
		this.cancelstatus = cancelstatus;
		this.matchingstatus = matchingstatus;
		this.pay = pay;
		this.paym = paym;
		this.status = status;
		this.category = category;
		this.helperlist = helperlist;
		this.image = image;
		this.renameimage = renameimage;
		this.phone = phone;
		this.nickname = nickname;
		this.danimcount = danimcount;
		this.review = review;
		this.helpername = helpername;
		this.helperphone = helperphone;
		this.helperdanimcount = helperdanimcount;
		this.helperreview = helperreview;
		this.dis = dis;
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

	public int getHelpno() {
		return helpno;
	}

	public void setHelpno(int helpno) {
		this.helpno = helpno;
	}

	public String getHelpid() {
		return helpid;
	}

	public void setHelpid(String helpid) {
		this.helpid = helpid;
	}

	public String getHelperid() {
		return helperid;
	}

	public void setHelperid(String helperid) {
		this.helperid = helperid;
	}

	public String getRoadaddress() {
		return roadaddress;
	}

	public void setRoadaddress(String roadaddress) {
		this.roadaddress = roadaddress;
	}

	public String getDetailaddress() {
		return detailaddress;
	}

	public void setDetailaddress(String detailaddress) {
		this.detailaddress = detailaddress;
	}

	public String getLocationcodelat() {
		return locationcodelat;
	}

	public void setLocationcodelat(String locationcodelat) {
		this.locationcodelat = locationcodelat;
	}

	public String getLocationcodelng() {
		return locationcodelng;
	}

	public void setLocationcodelng(String locationcodelng) {
		this.locationcodelng = locationcodelng;
	}

	public String getLocgroup() {
		return locgroup;
	}

	public void setLocgroup(String locgroup) {
		this.locgroup = locgroup;
	}

	public String getTargetroadaddress() {
		return targetroadaddress;
	}

	public void setTargetroadaddress(String targetroadaddress) {
		this.targetroadaddress = targetroadaddress;
	}

	public String getTargetdetailaddress() {
		return targetdetailaddress;
	}

	public void setTargetdetailaddress(String targetdetailaddress) {
		this.targetdetailaddress = targetdetailaddress;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public Date getHelpdate() {
		return helpdate;
	}

	public void setHelpdate(Date helpdate) {
		this.helpdate = helpdate;
	}

	public String getEndtime() {
		return endtime;
	}

	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}

	public String getReserdate() {
		return reserdate;
	}

	public void setReserdate(String reserdate) {
		this.reserdate = reserdate;
	}

	public String getResertime() {
		return resertime;
	}

	public void setResertime(String resertime) {
		this.resertime = resertime;
	}

	public String getUsingtime() {
		return usingtime;
	}

	public void setUsingtime(String usingtime) {
		this.usingtime = usingtime;
	}

	public String getHelptitle() {
		return helptitle;
	}

	public void setHelptitle(String helptitle) {
		this.helptitle = helptitle;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getMatching() {
		return matching;
	}

	public void setMatching(String matching) {
		this.matching = matching;
	}

	public String getCancelstatus() {
		return cancelstatus;
	}

	public void setCancelstatus(String cancelstatus) {
		this.cancelstatus = cancelstatus;
	}
	
	public String getMatchingstatus() {
		return matchingstatus;
	}

	public void setMatchingstatus(String matchingstatus) {
		this.matchingstatus = matchingstatus;
	}

	public String getPay() {
		return pay;
	}

	public void setPay(String pay) {
		this.pay = pay;
	}

	public String getPaym() {
		return paym;
	}

	public void setPaym(String paym) {
		this.paym = paym;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getHelperlist() {
		return helperlist;
	}

	public void setHelperlist(String helperlist) {
		this.helperlist = helperlist;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getRenameimage() {
		return renameimage;
	}

	public void setRenameimage(String renameimage) {
		this.renameimage = renameimage;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getDanimcount() {
		return danimcount;
	}

	public void setDanimcount(String danimcount) {
		this.danimcount = danimcount;
	}

	public int getReview() {
		return review;
	}

	public void setReview(int review) {
		this.review = review;
	}

	public String getHelpername() {
		return helpername;
	}

	public void setHelpername(String helpername) {
		this.helpername = helpername;
	}

	public String getHelperphone() {
		return helperphone;
	}

	public void setHelperphone(String helperphone) {
		this.helperphone = helperphone;
	}

	public String getHelperdanimcount() {
		return helperdanimcount;
	}

	public void setHelperdanimcount(String helperdanimcount) {
		this.helperdanimcount = helperdanimcount;
	}

	public int getHelperreview() {
		return helperreview;
	}

	public void setHelperreview(int helperreview) {
		this.helperreview = helperreview;
	}

	public double getDis() {
		return dis;
	}

	public void setDis(double dis) {
		this.dis = dis;
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
		return "Help [helpno=" + helpno + ", helpid=" + helpid + ", helperid=" + helperid + ", roadaddress="
				+ roadaddress + ", detailaddress=" + detailaddress + ", locationcodelat=" + locationcodelat
				+ ", locationcodelng=" + locationcodelng + ", locgroup=" + locgroup + ", targetroadaddress="
				+ targetroadaddress + ", targetdetailaddress=" + targetdetailaddress + ", time=" + time + ", helpdate="
				+ helpdate + ", endtime=" + endtime + ", reserdate=" + reserdate + ", resertime=" + resertime
				+ ", usingtime=" + usingtime + ", helptitle=" + helptitle + ", contents=" + contents + ", matching="
				+ matching + ", cancelstatus=" + cancelstatus + ", matchingstatus=" + matchingstatus + ", pay=" + pay
				+ ", paym=" + paym + ", status=" + status + ", category=" + category + ", helperlist=" + helperlist
				+ ", image=" + image + ", renameimage=" + renameimage + ", phone=" + phone + ", nickname=" + nickname
				+ ", danimcount=" + danimcount + ", review=" + review + ", helpername=" + helpername + ", helperphone="
				+ helperphone + ", helperdanimcount=" + helperdanimcount + ", helperreview=" + helperreview + ", dis="
				+ dis + ", cleaningnum=" + cleaningnum + ", deliverynum=" + deliverynum + ", shoppingnum=" + shoppingnum
				+ ", keepingnum=" + keepingnum + ", lineupnum=" + lineupnum + ", carenum=" + carenum + ", cosplaynum="
				+ cosplaynum + ", professionalnum=" + professionalnum + ", movingnum=" + movingnum + "]";
	}

	

	
}
