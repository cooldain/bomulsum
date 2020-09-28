package com.web.bomulsum.user.reserves.repository;

import java.sql.Date;

public class UserReservesVO {
	private String point_seq;
	private String member_code_seq;
	private String point_category;
	private int point_amount;
	private String point_detail;
	private Date point_date;
	public String getPoint_seq() {
		return point_seq;
	}
	public void setPoint_seq(String point_seq) {
		this.point_seq = point_seq;
	}
	public String getMember_code_seq() {
		return member_code_seq;
	}
	public void setMember_code_seq(String member_code_seq) {
		this.member_code_seq = member_code_seq;
	}
	public String getPoint_category() {
		return point_category;
	}
	public void setPoint_category(String point_category) {
		this.point_category = point_category;
	}
	public int getPoint_amount() {
		return point_amount;
	}
	public void setPoint_amount(int point_amount) {
		this.point_amount = point_amount;
	}
	public String getPoint_detail() {
		return point_detail;
	}
	public void setPoint_detail(String point_detail) {
		this.point_detail = point_detail;
	}
	public Date getPoint_date() {
		return point_date;
	}
	public void setPoint_date(Date point_date) {
		this.point_date = point_date;
	}
	@Override
	public String toString() {
		return "UserReservesVO [point_seq=" + point_seq + ", member_code_seq=" + member_code_seq + ", point_category="
				+ point_category + ", point_amount=" + point_amount + ", point_detail=" + point_detail + ", point_date="
				+ point_date + "]";
	}
	
	
	
}

