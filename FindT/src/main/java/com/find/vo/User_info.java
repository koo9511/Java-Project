package com.find.vo;

import java.sql.Date;

public class User_info {
	
	String user_code;
	String user_id;
	String user_pw;
	String user_nickname;
	Date signup_timestamp;
	Date lastlogin_timestamp;
	int is_active;
	
	public User_info() {}

	public User_info(String user_code, String user_id, String user_pw, String user_nickname, Date signup_timestamp,
			Date lastlogin_timestamp, int is_active) {
		super();
		this.user_code = user_code;
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_nickname = user_nickname;
		this.signup_timestamp = signup_timestamp;
		this.lastlogin_timestamp = lastlogin_timestamp;
		this.is_active = is_active;
	}

	public String getUser_code() {
		return user_code;
	}

	public void setUser_code(String user_code) {
		this.user_code = user_code;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	public Date getSignup_timestamp() {
		return signup_timestamp;
	}

	public void setSignup_timestamp(Date signup_timestamp) {
		this.signup_timestamp = signup_timestamp;
	}

	public Date getLastlogin_timestamp() {
		return lastlogin_timestamp;
	}

	public void setLastlogin_timestamp(Date lastlogin_timestamp) {
		this.lastlogin_timestamp = lastlogin_timestamp;
	}

	public int getIs_active() {
		return is_active;
	}

	public void setIs_active(int is_active) {
		this.is_active = is_active;
	}

	@Override
	public String toString() {
		return "User_info [user_code=" + user_code + ", user_id=" + user_id + ", user_pw=" + user_pw
				+ ", user_nickname=" + user_nickname + ", signup_timestamp=" + signup_timestamp
				+ ", lastlogin_timestamp=" + lastlogin_timestamp + ", is_active=" + is_active + "]";
	}
	
	

}
