package com.kh.danim.admin.model.vo;

public class Admin {
	private static final long serialVersionUID = 122L;

	private String adminid;
	private String adminpwd;
	private String adminname;
	
	public Admin () {}

	public Admin(String adminid, String adminpwd, String adminname) {
		super();
		this.adminid = adminid;
		this.adminpwd = adminpwd;
		this.adminname = adminname;
	}

	public String getAdminid() {
		return adminid;
	}

	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}

	public String getAdminpwd() {
		return adminpwd;
	}

	public void setAdminpwd(String adminpwd) {
		this.adminpwd = adminpwd;
	}

	public String getAdminname() {
		return adminname;
	}

	public void setAdminname(String adminname) {
		this.adminname = adminname;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Admin [adminid=" + adminid + ", adminpwd=" + adminpwd + ", adminname=" + adminname + "]";
	}
	
	
}
