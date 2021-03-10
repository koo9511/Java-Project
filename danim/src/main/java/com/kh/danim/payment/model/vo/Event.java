package com.kh.danim.payment.model.vo;

public class Event implements java.io.Serializable {

	private static final long serialVersionUID = -7352510049496747867L;
	
	private String userid;
	private String count;
	
	
	public Event() {}
	
	public Event(String userid, String count) {
		super();
		this.userid = userid;
		this.count = count;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	@Override
	public String toString() {
		return "Payment [userid=" + userid + ", count=" + count + "]";
	}

	
}
