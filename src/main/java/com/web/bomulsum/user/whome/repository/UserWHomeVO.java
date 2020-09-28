package com.web.bomulsum.user.whome.repository;

public class UserWHomeVO {
	private String art_code_seq;
	private String writer_code_seq;
	private String art_photo;
	private String art_name;
	private int art_price;
	private int art_discount;
	private String art_category;
	private String art_sale_state;

	private String writer_profile_img;
	private String writer_brand_name;
	private String writer_url;
	private String writer_intro;
	private int reviewStar;
	private int reviewTotal;
	
	
	
	public int getReviewStar() {
		return reviewStar;
	}
	public void setReviewStar(int reviewStar) {
		this.reviewStar = reviewStar;
	}
	public int getReviewTotal() {
		return reviewTotal;
	}
	public void setReviewTotal(int reviewTotal) {
		this.reviewTotal = reviewTotal;
	}
	public String getArt_code_seq() {
		return art_code_seq;
	}
	public void setArt_code_seq(String art_code_seq) {
		this.art_code_seq = art_code_seq;
	}
	public String getWriter_code_seq() {
		return writer_code_seq;
	}
	public void setWriter_code_seq(String writer_code_seq) {
		this.writer_code_seq = writer_code_seq;
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
	public String getArt_category() {
		return art_category;
	}
	public void setArt_category(String art_category) {
		this.art_category = art_category;
	}
	public String getArt_sale_state() {
		return art_sale_state;
	}
	public void setArt_sale_state(String art_sale_state) {
		this.art_sale_state = art_sale_state;
	}
	public String getWriter_profile_img() {
		return writer_profile_img;
	}
	public void setWriter_profile_img(String writer_profile_img) {
		this.writer_profile_img = writer_profile_img;
	}
	public String getWriter_brand_name() {
		return writer_brand_name;
	}
	public void setWriter_brand_name(String writer_brand_name) {
		this.writer_brand_name = writer_brand_name;
	}
	public String getWriter_url() {
		return writer_url;
	}
	public void setWriter_url(String writer_url) {
		this.writer_url = writer_url;
	}
	public String getWriter_intro() {
		return writer_intro;
	}
	public void setWriter_intro(String writer_intro) {
		this.writer_intro = writer_intro;
	}
	@Override
	public String toString() {
		return "UserWHomeVO [art_code_seq=" + art_code_seq + ", writer_code_seq=" + writer_code_seq + ", art_photo="
				+ art_photo + ", art_name=" + art_name + ", art_price=" + art_price + ", art_discount=" + art_discount
				+ ", art_category=" + art_category + ", art_sale_state=" + art_sale_state + ", writer_profile_img="
				+ writer_profile_img + ", writer_brand_name=" + writer_brand_name + ", writer_url=" + writer_url
				+ ", writer_intro=" + writer_intro + ", reviewStar=" + reviewStar + ", reviewTotal=" + reviewTotal
				+ "]";
	}
	
	
	
}
