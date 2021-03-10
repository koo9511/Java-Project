package com.kh.danim.helpcenter.model.vo;

import java.sql.Date;

public class HelpCenter implements java.io.Serializable{
	
	private static final long serialVersionUID = 1314L;
	
	private Integer helpcenterno;
	private String helpuserid;
	private String helpotherid;
	private String helptitle;
	private String helpcontent;
	private String helpcategory;
	private Date helpdate;
	private String helpstatus;
	private Integer helpno;
	
	public HelpCenter() {}
	
	public HelpCenter(Integer helpcenterno, String helpuserid, String helpotherid, String helptitle, String helpcontent,
			String helpcategory, Date helpdate, String helpstatus, Integer helpno) {
		super();
		this.helpcenterno = helpcenterno;
		this.helpuserid = helpuserid;
		this.helpotherid = helpotherid;
		this.helptitle = helptitle;
		this.helpcontent = helpcontent;
		this.helpcategory = helpcategory;
		this.helpdate = helpdate;
		this.helpstatus = helpstatus;
		this.helpno = helpno;
	}
	public Integer getHelpcenterno() {
		return helpcenterno;
	}
	public void setHelpcenterno(Integer helpcenterno) {
		this.helpcenterno = helpcenterno;
	}
	public String getHelpuserid() {
		return helpuserid;
	}
	public void setHelpuserid(String helpuserid) {
		this.helpuserid = helpuserid;
	}
	public String getHelpotherid() {
		return helpotherid;
	}
	public void setHelpotherid(String helpotherid) {
		this.helpotherid = helpotherid;
	}
	public String getHelptitle() {
		return helptitle;
	}
	public void setHelptitle(String helptitle) {
		this.helptitle = helptitle;
	}
	public String getHelpcontent() {
		return helpcontent;
	}
	public void setHelpcontent(String helpcontent) {
		this.helpcontent = helpcontent;
	}
	public String getHelpcategory() {
		return helpcategory;
	}
	public void setHelpcategory(String helpcategory) {
		this.helpcategory = helpcategory;
	}
	public Date getHelpdate() {
		return helpdate;
	}
	public void setHelpdate(Date helpdate) {
		this.helpdate = helpdate;
	}
	
	public String getHelpstatus() {
		return helpstatus;
	}
	public void setHelpstatus(String helpstatus) {
		this.helpstatus = helpstatus;
	}
	public Integer getHelpno() {
		return helpno;
	}
	public void setHelpno(Integer helpno) {
		this.helpno = helpno;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "HelpCenter [helpcenterno=" + helpcenterno + ", helpuserid=" + helpuserid + ", helpotherid="
				+ helpotherid + ", helptitle=" + helptitle + ", helpcontent=" + helpcontent + ", helpcategory="
				+ helpcategory + ", helpdate=" + helpdate +  ", helpstatus=" + helpstatus
				+ ", helpno=" + helpno + "]";
	}
	
}