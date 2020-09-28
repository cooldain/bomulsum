package com.web.bomulsum.user.orderList.repository;

public class AjaxRefundVO {
	private String buy_writer_code_seq;
	private String buy_art_code_seq;
	private String buy_option_code_seq;
	private int art_option_amount;
	private String art_option_name;
	private String art_photo;
	private String art_name;
	private String buy_writer_order_refund_reason;
	public String getBuy_writer_code_seq() {
		return buy_writer_code_seq;
	}
	public void setBuy_writer_code_seq(String buy_writer_code_seq) {
		this.buy_writer_code_seq = buy_writer_code_seq;
	}
	public String getBuy_art_code_seq() {
		return buy_art_code_seq;
	}
	public void setBuy_art_code_seq(String buy_art_code_seq) {
		this.buy_art_code_seq = buy_art_code_seq;
	}
	public String getBuy_option_code_seq() {
		return buy_option_code_seq;
	}
	public void setBuy_option_code_seq(String buy_option_code_seq) {
		this.buy_option_code_seq = buy_option_code_seq;
	}
	public int getArt_option_amount() {
		return art_option_amount;
	}
	public void setArt_option_amount(int art_option_amount) {
		this.art_option_amount = art_option_amount;
	}
	public String getArt_option_name() {
		return art_option_name;
	}
	public void setArt_option_name(String art_option_name) {
		this.art_option_name = art_option_name;
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
	public String getBuy_writer_order_refund_reason() {
		return buy_writer_order_refund_reason;
	}
	public void setBuy_writer_order_refund_reason(String buy_writer_order_refund_reason) {
		this.buy_writer_order_refund_reason = buy_writer_order_refund_reason;
	}
	@Override
	public String toString() {
		return "AjaxRefundVO [buy_writer_code_seq=" + buy_writer_code_seq + ", buy_art_code_seq=" + buy_art_code_seq
				+ ", buy_option_code_seq=" + buy_option_code_seq + ", art_option_amount=" + art_option_amount
				+ ", art_option_name=" + art_option_name + ", art_photo=" + art_photo + ", art_name=" + art_name
				+ ", buy_writer_order_refund_reason=" + buy_writer_order_refund_reason + "]";
	}
	
	
}
