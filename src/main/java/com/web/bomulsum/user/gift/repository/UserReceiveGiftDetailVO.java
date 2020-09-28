package com.web.bomulsum.user.gift.repository;

public class UserReceiveGiftDetailVO {
	private String order_code_seq;
	private String member_code_seq;
	private String member_name;
	private String member_phone;
	private String gift_message;
	private String gift_recipient_name;
	private String gift_recipient_phone;
	private String order_address_input;
	private String order_zipcode;
	private String order_address_first;
	private String order_address_second;
	private String order_status;
	private String writer_brand_name;
	private String b_art_name;
	private String b_writer_code_seq;
	private String art_photo;
	

	@Override
	public String toString() {
		return "UserReceiveGiftDetailVO [order_code_seq=" + order_code_seq + ", member_code_seq=" + member_code_seq
				+ ", member_name=" + member_name + ", member_phone=" + member_phone + ", gift_message=" + gift_message
				+ ", gift_recipient_name=" + gift_recipient_name + ", gift_recipient_phone=" + gift_recipient_phone
				+ ", order_address_input=" + order_address_input + ", order_zipcode=" + order_zipcode
				+ ", order_address_first=" + order_address_first + ", order_address_second=" + order_address_second
				+ ", order_status=" + order_status + ", writer_brand_name=" + writer_brand_name + ", b_art_name="
				+ b_art_name + ", b_writer_code_seq=" + b_writer_code_seq + ", art_photo=" + art_photo + "]";
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

	public String getGift_message() {
		return gift_message;
	}

	public void setGift_message(String gift_message) {
		this.gift_message = gift_message;
	}


	public String getOrder_status() {
		return order_status;
	}

	public void setOrder_status(String order_status) {
		this.order_status = order_status;
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


	public String getGift_recipient_name() {
		return gift_recipient_name;
	}

	public void setGift_recipient_name(String gift_recipient_name) {
		this.gift_recipient_name = gift_recipient_name;
	}

	public String getOrder_address_input() {
		return order_address_input;
	}

	public void setOrder_address_input(String order_address_input) {
		this.order_address_input = order_address_input;
	}

	public String getOrder_zipcode() {
		return order_zipcode;
	}

	public void setOrder_zipcode(String order_zipcode) {
		this.order_zipcode = order_zipcode;
	}

	public String getOrder_address_first() {
		return order_address_first;
	}

	public void setOrder_address_first(String order_address_first) {
		this.order_address_first = order_address_first;
	}

	public String getOrder_address_second() {
		return order_address_second;
	}

	public void setOrder_address_second(String order_address_second) {
		this.order_address_second = order_address_second;
	}

	public String getGift_recipient_phone() {
		return gift_recipient_phone;
	}

	public void setGift_recipient_phone(String gift_recipient_phone) {
		this.gift_recipient_phone = gift_recipient_phone;
	}

	
}
