package com.kh.danim.payment.model.vo;

import java.sql.Date;

public class Payment implements java.io.Serializable {

	private static final long serialVersionUID = -7352510049496747866L;
	
	/*private int payno;*/
	private Date paymentdate;
	private String scharge;
	private String paymoney;
	private String division;
	private String userid;
	private String category;
	private String minusmoney;
	private String count;
	private String eventdate;
	private String eventcount;
	
	
	public Payment() {}
	
	public Payment(Date paymentdate, String scharge, String paymoney, String division, String userid, String category,
			String minusmoney, String count, String eventdate, String eventcount) {
		super();
		this.paymentdate = paymentdate;
		this.scharge = scharge;
		this.paymoney = paymoney;
		this.division = division;
		this.userid = userid;
		this.category = category;
		this.minusmoney = minusmoney;
		this.count = count;
		this.eventdate = eventdate;
		this.eventcount = eventcount;
	}

	
	public String getEventdate() {
		return eventdate;
	}

	public void setEventdate(String eventdate) {
		this.eventdate = eventdate;
	}

	public String getEventcount() {
		return eventcount;
	}

	public void setEventcount(String eventcount) {
		this.eventcount = eventcount;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getMinusmoney() {
		return minusmoney;
	}

	public void setMinusmoney(String minusmoney) {
		this.minusmoney = minusmoney;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	public Date getPaymentdate() {
		return paymentdate;
	}

	public void setPaymentdate(Date paymentdate) {
		this.paymentdate = paymentdate;
	}

	public String getScharge() {
		return scharge;
	}

	public void setScharge(String scharge) {
		this.scharge = scharge;
	}

	public String getPaymoney() {
		return paymoney;
	}

	public void setPaymoney(String paymoney) {
		this.paymoney = paymoney;
	}

	public String getDivision() {
		return division;
	}

	public void setDivision(String division) {
		this.division = division;
	}

	@Override
	public String toString() {
		return "Payment [paymentdate=" + paymentdate + ", scharge=" + scharge + ", paymoney=" + paymoney + ", division="
				+ division + ", userid=" + userid + ", category=" + category + ", minusmoney=" + minusmoney + ", count="
				+ count + ", eventdate=" + eventdate + ", eventcount=" + eventcount + "]";
	}

	
}
