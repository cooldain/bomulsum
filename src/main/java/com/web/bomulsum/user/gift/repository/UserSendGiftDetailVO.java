package com.web.bomulsum.user.gift.repository;

import java.sql.Date;

public class UserSendGiftDetailVO {
	
	private String order_code_seq;
	private String gift_recipient_name;
	private String gift_recipient_phone;
	private String gift_message;
	private Date limitDate;
	private Date order_date;
	private String order_address_input;
	private String order_payment;
	private String order_status;
	private int order_pay_price;
	private String order_request;
	private String writer_brand_name;
	private String b_art_code_seq;
	private String b_art_name;
	private String b_writer_code_seq;
	private int b_art_option_count;
	private String art_photo;
	private int art_point;
	
	@Override
	public String toString() {
		return "UserSendGiftDetailVO [order_code_seq=" + order_code_seq + ", gift_recipient_name=" + gift_recipient_name
				+ ", gift_recipient_phone=" + gift_recipient_phone + ", gift_message=" + gift_message + ", limitDate="
				+ limitDate + ", order_date=" + order_date + ", order_address_input=" + order_address_input
				+ ", order_payment=" + order_payment + ", order_status=" + order_status + ", order_pay_price="
				+ order_pay_price + ", order_request=" + order_request + ", writer_brand_name=" + writer_brand_name
				+ ", b_art_code_seq=" + b_art_code_seq + ", b_art_name=" + b_art_name + ", b_writer_code_seq="
				+ b_writer_code_seq + ", b_art_option_count=" + b_art_option_count + ", art_photo=" + art_photo
				+ ", art_point=" + art_point + "]";
	}

	public String getOrder_code_seq() {
		return order_code_seq;
	}

	public void setOrder_code_seq(String order_code_seq) {
		this.order_code_seq = order_code_seq;
	}

	public String getGift_recipient_name() {
		return gift_recipient_name;
	}

	public void setGift_recipient_name(String gift_recipient_name) {
		this.gift_recipient_name = gift_recipient_name;
	}

	public String getGift_recipient_phone() {
		return gift_recipient_phone;
	}

	public void setGift_recipient_phone(String gift_recipient_phone) {
		this.gift_recipient_phone = gift_recipient_phone;
	}

	public String getGift_message() {
		return gift_message;
	}

	public void setGift_message(String gift_message) {
		this.gift_message = gift_message;
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

	public String getOrder_payment() {
		return order_payment;
	}

	public void setOrder_payment(String order_payment) {
		this.order_payment = order_payment;
	}

	public String getOrder_status() {
		return order_status;
	}

	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}

	public int getOrder_pay_price() {
		return order_pay_price;
	}

	public void setOrder_pay_price(int order_pay_price) {
		this.order_pay_price = order_pay_price;
	}

	public String getOrder_request() {
		return order_request;
	}

	public void setOrder_request(String order_request) {
		this.order_request = order_request;
	}

	public String getWriter_brand_name() {
		return writer_brand_name;
	}

	public void setWriter_brand_name(String writer_brand_name) {
		this.writer_brand_name = writer_brand_name;
	}

	public String getB_art_code_seq() {
		return b_art_code_seq;
	}

	public void setB_art_code_seq(String b_art_code_seq) {
		this.b_art_code_seq = b_art_code_seq;
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

	public int getB_art_option_count() {
		return b_art_option_count;
	}

	public void setB_art_option_count(int b_art_option_count) {
		this.b_art_option_count = b_art_option_count;
	}

	public String getArt_photo() {
		return art_photo;
	}

	public void setArt_photo(String art_photo) {
		this.art_photo = art_photo;
	}

	public int getArt_point() {
		return art_point;
	}

	public void setArt_point(int art_point) {
		this.art_point = art_point;
	}

	public Date getLimitDate() {
		return limitDate;
	}

	public void setLimitDate(Date limitDate) {
		this.limitDate = limitDate;
	}

}



