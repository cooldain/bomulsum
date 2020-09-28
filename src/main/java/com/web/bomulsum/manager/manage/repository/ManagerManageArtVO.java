package com.web.bomulsum.manager.manage.repository;

public class ManagerManageArtVO {
	private String art_code_seq;
	private String art_photo;
	private String art_name;
	private String writer_brand_name;
	private String writer_name;
	private String art_category;
	private String art_sale_state;
	private int art_sale_count;

	@Override
	public String toString() {
		return "ManagerManageArtVO [art_code_seq=" + art_code_seq + ", art_photo=" + art_photo + ", art_name="
				+ art_name + ", writer_brand_name=" + writer_brand_name + ", writer_name=" + writer_name
				+ ", art_category=" + art_category + ", art_sale_state=" + art_sale_state + ", art_sale_count="
				+ art_sale_count + "]";
	}

	public String getArt_code_seq() {
		return art_code_seq;
	}

	public void setArt_code_seq(String art_code_seq) {
		this.art_code_seq = art_code_seq;
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

	public int getArt_sale_count() {
		return art_sale_count;
	}

	public void setArt_sale_count(int art_sale_count) {
		this.art_sale_count = art_sale_count;
	}
	
}
