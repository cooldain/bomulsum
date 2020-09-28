package com.web.bomulsum.manager.list.repository;

public class ManagerListWriterVO {
	
	private String writer_code_seq;
	private String writer_name;
	private String writer_brand_name;
	private String writer_email;
	private String writer_phone;
	private String writer_url;
	
	@Override
	public String toString() {
		return "ManagerListWriterVO [writer_code_seq=" + writer_code_seq + ", writer_name=" + writer_name
				+ ", writer_brand_name=" + writer_brand_name + ", writer_email=" + writer_email + ", writer_phone="
				+ writer_phone + ", writer_url=" + writer_url + "]";
	}

	public String getWriter_code_seq() {
		return writer_code_seq;
	}

	public void setWriter_code_seq(String writer_code_seq) {
		this.writer_code_seq = writer_code_seq;
	}

	public String getWriter_name() {
		return writer_name;
	}
	public void setWriter_name(String writer_name) {
		this.writer_name = writer_name;
	}
	public String getWriter_brand_name() {
		return writer_brand_name;
	}
	public void setWriter_brand_name(String writer_brand_name) {
		this.writer_brand_name = writer_brand_name;
	}

	public String getWriter_email() {
		return writer_email;
	}

	public void setWriter_email(String writer_email) {
		this.writer_email = writer_email;
	}

	public String getWriter_phone() {
		return writer_phone;
	}
	public void setWriter_phone(String writer_phone) {
		this.writer_phone = writer_phone;
	}
	public String getWriter_url() {
		return writer_url;
	}
	public void setWriter_url(String writer_url) {
		this.writer_url = writer_url;
	}


}
