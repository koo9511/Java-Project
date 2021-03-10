package com.kh.danim.user.model.vo;

public class Chatting implements java.io.Serializable{
	
	private static final long serialVersionUID = 920L;

	private int chatno;
	private String chathelp;
	private String chathelper;
	private String chatcontent;
	private String chatdate;
	
	public Chatting() {}
	
	public Chatting(int chatno, String chathelp, String chathelper, String chatcontent, String chatdate) {
		super();
		this.chatno = chatno;
		this.chathelp = chathelp;
		this.chathelper = chathelper;
		this.chatcontent = chatcontent;
		this.chatdate = chatdate;
	}

	public int getChatno() {
		return chatno;
	}

	public void setChatno(int chatno) {
		this.chatno = chatno;
	}

	public String getChathelp() {
		return chathelp;
	}

	public void setChathelp(String chathelp) {
		this.chathelp = chathelp;
	}

	public String getChathelper() {
		return chathelper;
	}

	public void setChathelper(String chathelper) {
		this.chathelper = chathelper;
	}

	public String getChatcontent() {
		return chatcontent;
	}

	public void setChatcontent(String chatcontent) {
		this.chatcontent = chatcontent;
	}

	public String getchatdate() {
		return chatdate;
	}

	public void setchatdate(String chatdate) {
		this.chatdate = chatdate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Chatting [chatno=" + chatno + ", chathelp=" + chathelp + ", chathelper=" + chathelper + ", chatcontent="
				+ chatcontent + ", chatdate=" + chatdate + "]";
	}
	
	
	
	

}