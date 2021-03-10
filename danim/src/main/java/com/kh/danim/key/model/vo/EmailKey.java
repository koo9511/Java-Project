package com.kh.danim.key.model.vo;

public class EmailKey implements java.io.Serializable{
	
	private static final long serialVersionUID = 300L;
	
	private String key;
	
	public EmailKey() {}

	public EmailKey(String key) {
		super();
		this.key = key;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "EmailKey [key=" + key + "]";
	}
	
	
}
