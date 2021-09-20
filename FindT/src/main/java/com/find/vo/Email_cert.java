package com.find.vo;

public class Email_cert {

	String user_email;
	String cert_key;
	
	public Email_cert() {}

	public Email_cert(String user_email, String cert_key) {
		super();
		this.user_email = user_email;
		this.cert_key = cert_key;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getCert_key() {
		return cert_key;
	}

	public void setCert_key(String cert_key) {
		this.cert_key = cert_key;
	}

	@Override
	public String toString() {
		return "Email_cert [user_email=" + user_email + ", cert_key=" + cert_key + "]";
	}
	
	
}
