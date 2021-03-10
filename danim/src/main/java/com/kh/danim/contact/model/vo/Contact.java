package com.kh.danim.contact.model.vo;

import java.sql.Date;

public class Contact  implements java.io.Serializable{

	private static final long serialVersionUID = 600L;
	
	private int contactno;
	private String writername;
	private String writeremail;
	private String contacttitle;
	private String contactcontent;
	private String contactstatus;
	private Date contactdate;
	
	public Contact() {}

	public Contact(int contactno, String writername, String writeremail, String contacttitle, String contactcontent, String contactstatus, Date contactdate) {
		super();
		this.contactno = contactno;
		this.writername = writername;
		this.writeremail = writeremail;
		this.contacttitle = contacttitle;
		this.contactcontent = contactcontent;
		this.contactstatus = contactstatus;
		this.contactdate = contactdate;
	}

	public int getContactno() {
		return contactno;
	}

	public void setContactno(int contactno) {
		this.contactno = contactno;
	}

	public String getWritername() {
		return writername;
	}

	public void setWritername(String writername) {
		this.writername = writername;
	}

	public String getWriteremail() {
		return writeremail;
	}

	public void setWriteremail(String writeremail) {
		this.writeremail = writeremail;
	}

	public String getContacttitle() {
		return contacttitle;
	}

	public void setContacttitle(String contacttitle) {
		this.contacttitle = contacttitle;
	}

	public String getContactcontent() {
		return contactcontent;
	}

	public void setContactcontent(String contactcontent) {
		this.contactcontent = contactcontent;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	public String getContactstatus() {
		return contactstatus;
	}
	
	public void setContactstatus(String contactstatus) {
		this.contactstatus = contactstatus;
	}
	
	public Date getContactdate() {
		return contactdate;
	}
	
	public void setContactdate(Date contactdate) {
		this.contactdate = contactdate;
	}

	@Override
	public String toString() {
		return "Contact [contactno=" + contactno + ", writername=" + writername + ", writeremail=" + writeremail
				+ ", contacttitle=" + contacttitle + ", contactcontent=" + contactcontent + "]";
	};
	
	
}
