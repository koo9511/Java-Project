package com.kh.danim.notice.model.vo;

import java.sql.Date;

public class Notice implements java.io.Serializable{
	
	private static final long serialVersionUID = 110L;
	
	private int noticeno;
	private String noticetitle;
	private Date noticedate;
	private String noticecontent;
	
	public Notice() {}
	
	public Notice(int noticeno, String noticetitle, Date noticedate, String noticecontent) {
		super();
		this.noticeno = noticeno;
		this.noticetitle = noticetitle;
		this.noticedate = noticedate;
		this.noticecontent = noticecontent;
	}

	public int getNoticeno() {
		return noticeno;
	}

	public void setNoticeno(int noticeno) {
		this.noticeno = noticeno;
	}

	public String getNoticetitle() {
		return noticetitle;
	}

	public void setNoticetitle(String noticetitle) {
		this.noticetitle = noticetitle;
	}

	public Date getNoticedate() {
		return noticedate;
	}

	public void setNoticedate(Date noticedate) {
		this.noticedate = noticedate;
	}

	public String getNoticecontent() {
		return noticecontent;
	}

	public void setNoticecontent(String noticecontent) {
		this.noticecontent = noticecontent;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Notice [noticeno=" + noticeno + ", noticetitle=" + noticetitle + ", noticedate=" + noticedate
				+ ", noticecontent=" + noticecontent + "]";
	}
	
	
	
}
