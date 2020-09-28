package com.web.bomulsum.user.gift.repository;

import java.sql.Date;

public class UserReceiveGiftVO {
	private String gift_seq;
	private String order_code_seq;
	private String member_code_seq;
	private String member_name;
	private String member_phone;
	private Date order_date;
	private String order_address_input;
	private String writer_brand_name;
	private String b_art_name;
	private String b_writer_code_seq;
	private String art_photo;
	private Date limitDate;
	
	@Override
	public String toString() {
		return "UserReceiveGiftVO [gift_seq=" + gift_seq + ", order_code_seq=" + order_code_seq + ", member_code_seq="
				+ member_code_seq + ", member_name=" + member_name + ", member_phone=" + member_phone + ", order_date="
				+ order_date + ", order_address_input=" + order_address_input + ", writer_brand_name="
				+ writer_brand_name + ", b_art_name=" + b_art_name + ", b_writer_code_seq=" + b_writer_code_seq
				+ ", art_photo=" + art_photo + ", limitDate=" + limitDate + "]";
	}

	public String getGift_seq() {
		return gift_seq;
	}

	public void setGift_seq(String gift_seq) {
		this.gift_seq = gift_seq;
	}

	public String getOrder_code_seq() {
		return order_code_seq;
	}

	public void setOrder_code_seq(String order_code_seq) {
		this.order_code_seq = order_code_seq;
	}

	public String getMember_code_seq() {
		return member_code_seq;
	}

	public void setMember_code_seq(String member_code_seq) {
		this.member_code_seq = member_code_seq;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	public String getOrder_address_input() {
		return order_address_input;
	}

	public void setOrder_address_input(String order_address_input) {
		this.order_address_input = order_address_input;
	}

	public String getWriter_brand_name() {
		return writer_brand_name;
	}

	public void setWriter_brand_name(String writer_brand_name) {
		this.writer_brand_name = writer_brand_name;
	}

	public String getB_art_name() {
		return b_art_name;
	}

	public void setB_art_name(String b_art_name) {
		this.b_art_name = b_art_name;
	}

	public String getB_writer_code_seq() {
		return b_writer_code_seq;
	}

	public void setB_writer_code_seq(String b_writer_code_seq) {
		this.b_writer_code_seq = b_writer_code_seq;
	}

	public String getArt_photo() {
		return art_photo;
	}

	public void setArt_photo(String art_photo) {
		this.art_photo = art_photo;
	}

	public Date getLimitDate() {
		return limitDate;
	}

	public void setLimitDate(Date limitDate) {
		this.limitDate = limitDate;
	}
	
	

}
