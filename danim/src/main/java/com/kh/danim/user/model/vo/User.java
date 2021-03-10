package com.kh.danim.user.model.vo;

import java.sql.Date;

public class User implements java.io.Serializable{
	
	private static final long serialVersionUID = 100L;

	private String nickname;
	private String username;
	private String userid;
	private String userpwd;
	private String usernum;
	private String phone;
	private String ground;
	private String danimcount;
	private String block;
	private String black;
	private int money;
	private String account;
	private String accountname;
	private Date enrolldate;
	private double review;
	private String event;
	
	public User() {}

	public User(String nickname, String username, String userid, String userpwd, String usernum, String phone,
			String ground, String danimcount, String block, String black, int money, String account, String accountname,
			Date enrolldate, double review, String event) {
		super();
		this.nickname = nickname;
		this.username = username;
		this.userid = userid;
		this.userpwd = userpwd;
		this.usernum = usernum;
		this.phone = phone;
		this.ground = ground;
		this.danimcount = danimcount;
		this.block = block;
		this.black = black;
		this.money = money;
		this.account = account;
		this.accountname = accountname;
		this.enrolldate = enrolldate;
		this.review = review;
		this.event = event;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUserpwd() {
		return userpwd;
	}

	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}

	public String getUsernum() {
		return usernum;
	}

	public void setUsernum(String usernum) {
		this.usernum = usernum;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getGround() {
		return ground;
	}

	public void setGround(String ground) {
		this.ground = ground;
	}

	public String getDanimcount() {
		return danimcount;
	}

	public void setDanimcount(String danimcount) {
		this.danimcount = danimcount;
	}

	public String getBlock() {
		return block;
	}

	public void setBlock(String block) {
		this.block = block;
	}

	public String getBlack() {
		return black;
	}

	public void setBlack(String black) {
		this.black = black;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getAccountname() {
		return accountname;
	}

	public void setAccountname(String accountname) {
		this.accountname = accountname;
	}

	public Date getEnrolldate() {
		return enrolldate;
	}

	public void setEnrolldate(Date enrolldate) {
		this.enrolldate = enrolldate;
	}

	public double getReview() {
		return review;
	}

	public void setReview(double review) {
		this.review = review;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getEvent() {
		return event;
	}

	public void setEvent(String event) {
		this.event = event;
	}

	@Override
	public String toString() {
		return "User [nickname=" + nickname + ", username=" + username + ", userid=" + userid + ", userpwd=" + userpwd
				+ ", usernum=" + usernum + ", phone=" + phone + ", ground=" + ground + ", danimcount=" + danimcount
				+ ", block=" + block + ", black=" + black + ", money=" + money + ", account=" + account
				+ ", accountname=" + accountname + ", enrolldate=" + enrolldate + ", review=" + review + "]";
	}

	
	

}