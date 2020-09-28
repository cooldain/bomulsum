package com.web.bomulsum.writer.board.repository;

import java.sql.Date;

public class writerBoardVO {
	private String admin_notice_seq;
	private String admin_notice_category;
	private String admin_notice_title;
	private String admin_notice_content;
	private String admin_notice_coupon;
	private Date admin_notice_date;
	

	
	public String getAdmin_notice_seq() {
		return admin_notice_seq;
	}
	public void setAdmin_notice_seq(String admin_notice_seq) {
		this.admin_notice_seq = admin_notice_seq;
	}

	public String getAdmin_notice_category() {
		return admin_notice_category;
	}
	public void setAdmin_notice_category(String admin_notice_category) {
		this.admin_notice_category = admin_notice_category;
	}
	public String getAdmin_notice_title() {
		return admin_notice_title;
	}
	public void setAdmin_notice_title(String admin_notice_title) {
		this.admin_notice_title = admin_notice_title;
	}
	public String getAdmin_notice_content() {
		return admin_notice_content;
	}
	public void setAdmin_notice_content(String admin_notice_content) {
		this.admin_notice_content = admin_notice_content;
	}
	public String getAdmin_notice_coupon() {
		return admin_notice_coupon;
	}
	public void setAdmin_notice_coupon(String admin_notice_coupon) {
		this.admin_notice_coupon = admin_notice_coupon;
	}
	@Override
	public String toString() {
		return "writerBoardVO [admin_notice_seq=" + admin_notice_seq + ", admin_notice_category="
				+ admin_notice_category + ", admin_notice_title=" + admin_notice_title + ", admin_notice_content="
				+ admin_notice_content + ", admin_notice_date=" + admin_notice_date + ", admin_notice_coupon="
				+ admin_notice_coupon + "]";
	}
	
	
	
	
	public Date getAdmin_notice_date() {
		return admin_notice_date;
	}
	public void setAdmin_notice_date(Date admin_notice_date) {
		this.admin_notice_date = admin_notice_date;
	}

}
