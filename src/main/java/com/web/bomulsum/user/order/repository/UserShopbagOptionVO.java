package com.web.bomulsum.user.order.repository;

public class UserShopbagOptionVO {

	private String art_option_seq;
	private String art_option_category;
	private String art_option_name;
	private int art_option_price;

	@Override
	public String toString() {
		return "UserShopbagOptionVO [art_option_seq=" + art_option_seq + ", art_option_category=" + art_option_category
				+ ", art_option_name=" + art_option_name + ", art_option_price=" + art_option_price + "]";
	}

	public String getArt_option_seq() {
		return art_option_seq;
	}

	public void setArt_option_seq(String art_option_seq) {
		this.art_option_seq = art_option_seq;
	}

	public String getArt_option_category() {
		return art_option_category;
	}

	public void setArt_option_category(String art_option_category) {
		this.art_option_category = art_option_category;
	}

	public String getArt_option_name() {
		return art_option_name;
	}

	public void setArt_option_name(String art_option_name) {
		this.art_option_name = art_option_name;
	}

	public int getArt_option_price() {
		return art_option_price;
	}

	public void setArt_option_price(int art_option_price) {
		this.art_option_price = art_option_price;
	}

	
	
}
