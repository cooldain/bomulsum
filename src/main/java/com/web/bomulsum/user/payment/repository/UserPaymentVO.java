package com.web.bomulsum.user.payment.repository;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

public class UserPaymentVO {
	private String cart_seq;
	private String art_code_seq;
	private String member_code_seq;
	private String art_option_seq;
	private String art_count;
	private String[] artCount;
	private String order_request;
	private String writer_brand_name;
	private String writer_name;
	private int writer_send_price;
	private int writer_sendfree_case;
	private String art_photo;
	private String art_name;
	private int art_price;
	private int art_discount;
	private int totalPrice;
	private List<Map<String,Object>> totalOption;
	private int art_point;
	private int writer_plus_price;
	private String writer_code_seq;
	public String getCart_seq() {
		return cart_seq;
	}
	public void setCart_seq(String cart_seq) {
		this.cart_seq = cart_seq;
	}
	public String getArt_code_seq() {
		return art_code_seq;
	}
	public void setArt_code_seq(String art_code_seq) {
		this.art_code_seq = art_code_seq;
	}
	public String getMember_code_seq() {
		return member_code_seq;
	}
	public void setMember_code_seq(String member_code_seq) {
		this.member_code_seq = member_code_seq;
	}
	public String getArt_option_seq() {
		return art_option_seq;
	}
	public void setArt_option_seq(String art_option_seq) {
		this.art_option_seq = art_option_seq;
	}
	public String getArt_count() {
		return art_count;
	}
	public void setArt_count(String art_count) {
		this.art_count = art_count;
	}
	public String[] getArtCount() {
		return artCount;
	}
	public void setArtCount(String[] artCount) {
		this.artCount = artCount;
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
	public String getWriter_name() {
		return writer_name;
	}
	public void setWriter_name(String writer_name) {
		this.writer_name = writer_name;
	}
	public int getWriter_send_price() {
		return writer_send_price;
	}
	public void setWriter_send_price(int writer_send_price) {
		this.writer_send_price = writer_send_price;
	}
	public int getWriter_sendfree_case() {
		return writer_sendfree_case;
	}
	public void setWriter_sendfree_case(int writer_sendfree_case) {
		this.writer_sendfree_case = writer_sendfree_case;
	}
	public String getArt_photo() {
		return art_photo;
	}
	public void setArt_photo(String art_photo) {
		this.art_photo = art_photo;
	}
	public String getArt_name() {
		return art_name;
	}
	public void setArt_name(String art_name) {
		this.art_name = art_name;
	}
	public int getArt_price() {
		return art_price;
	}
	public void setArt_price(int art_price) {
		this.art_price = art_price;
	}
	public int getArt_discount() {
		return art_discount;
	}
	public void setArt_discount(int art_discount) {
		this.art_discount = art_discount;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public List<Map<String, Object>> getTotalOption() {
		return totalOption;
	}
	public void setTotalOption(List<Map<String, Object>> totalOption) {
		this.totalOption = totalOption;
	}
	public int getArt_point() {
		return art_point;
	}
	public void setArt_point(int art_point) {
		this.art_point = art_point;
	}
	public int getWriter_plus_price() {
		return writer_plus_price;
	}
	public void setWriter_plus_price(int writer_plus_price) {
		this.writer_plus_price = writer_plus_price;
	}
	public String getWriter_code_seq() {
		return writer_code_seq;
	}
	public void setWriter_code_seq(String writer_code_seq) {
		this.writer_code_seq = writer_code_seq;
	}
	@Override
	public String toString() {
		return "UserPaymentVO [cart_seq=" + cart_seq + ", art_code_seq=" + art_code_seq + ", member_code_seq="
				+ member_code_seq + ", art_option_seq=" + art_option_seq + ", art_count=" + art_count + ", artCount="
				+ Arrays.toString(artCount) + ", order_request=" + order_request + ", writer_brand_name="
				+ writer_brand_name + ", writer_name=" + writer_name + ", writer_send_price=" + writer_send_price
				+ ", writer_sendfree_case=" + writer_sendfree_case + ", art_photo=" + art_photo + ", art_name="
				+ art_name + ", art_price=" + art_price + ", art_discount=" + art_discount + ", totalPrice="
				+ totalPrice + ", totalOption=" + totalOption + ", art_point=" + art_point + ", writer_plus_price="
				+ writer_plus_price + ", writer_code_seq=" + writer_code_seq + "]";
	}
	
	
	
	
}
