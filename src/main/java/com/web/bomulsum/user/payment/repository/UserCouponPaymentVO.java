package com.web.bomulsum.user.payment.repository;

import java.sql.Date;

public class UserCouponPaymentVO {
	
	private String coupon_code_seq;
	private String member_code_seq;
	private String coupon_name;
	private String coupon_content;
	private String coupon_price;
	private Date coupon_date;
	private String coupon_usage;
	public String getCoupon_code_seq() {
		return coupon_code_seq;
	}
	public void setCoupon_code_seq(String coupon_code_seq) {
		this.coupon_code_seq = coupon_code_seq;
	}
	public String getMember_code_seq() {
		return member_code_seq;
	}
	public void setMember_code_seq(String member_code_seq) {
		this.member_code_seq = member_code_seq;
	}
	public String getCoupon_name() {
		return coupon_name;
	}
	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
	}
	public String getCoupon_content() {
		return coupon_content;
	}
	public void setCoupon_content(String coupon_content) {
		this.coupon_content = coupon_content;
	}
	public String getCoupon_price() {
		return coupon_price;
	}
	public void setCoupon_price(String coupon_price) {
		this.coupon_price = coupon_price;
	}
	public Date getCoupon_date() {
		return coupon_date;
	}
	public void setCoupon_date(Date coupon_date) {
		this.coupon_date = coupon_date;
	}
	public String getCoupon_usage() {
		return coupon_usage;
	}
	public void setCoupon_usage(String coupon_usage) {
		this.coupon_usage = coupon_usage;
	}
	@Override
	public String toString() {
		return "UserCouponPaymentVO [coupon_code_seq=" + coupon_code_seq + ", member_code_seq=" + member_code_seq
				+ ", coupon_name=" + coupon_name + ", coupon_content=" + coupon_content + ", coupon_price="
				+ coupon_price + ", coupon_date=" + coupon_date + ", coupon_usage=" + coupon_usage + "]";
	}
	
	
	

	
}
