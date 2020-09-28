package com.web.bomulsum.manager.manage.repository;

public class ManagerManageClassVO {
	private String midas_code_seq;
	private String midas_img;
	private String midas_name;
	private String writer_brand_name;
	private String writer_name;
	private String midas_category;
	private String midas_run;
	private String midas_start_date;
	private String midas_end_date;

	@Override
	public String toString() {
		return "ManagerManageClassVO [midas_code_seq=" + midas_code_seq + ", midas_img=" + midas_img + ", midas_name="
				+ midas_name + ", writer_brand_name=" + writer_brand_name + ", writer_name=" + writer_name
				+ ", midas_category=" + midas_category + ", midas_run=" + midas_run + ", midas_start_date="
				+ midas_start_date + ", midas_end_date=" + midas_end_date + "]";
	}

	public String getMidas_code_seq() {
		return midas_code_seq;
	}

	public void setMidas_code_seq(String midas_code_seq) {
		this.midas_code_seq = midas_code_seq;
	}

	public String getMidas_img() {
		return midas_img;
	}
	public void setMidas_img(String midas_img) {
		this.midas_img = midas_img;
	}
	public String getMidas_name() {
		return midas_name;
	}
	public void setMidas_name(String midas_name) {
		this.midas_name = midas_name;
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

	public String getMidas_category() {
		return midas_category;
	}
	public void setMidas_category(String midas_category) {
		this.midas_category = midas_category;
	}
	
	public String getMidas_run() {
		return midas_run;
	}

	public void setMidas_run(String midas_run) {
		this.midas_run = midas_run;
	}

	public String getMidas_start_date() {
		return midas_start_date;
	}
	public void setMidas_start_date(String midas_start_date) {
		this.midas_start_date = midas_start_date;
	}
	public String getMidas_end_date() {
		return midas_end_date;
	}
	public void setMidas_end_date(String midas_end_date) {
		this.midas_end_date = midas_end_date;
	}
	
	
}
