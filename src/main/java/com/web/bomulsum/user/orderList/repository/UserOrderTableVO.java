package com.web.bomulsum.user.orderList.repository;

import java.sql.Date;

public class UserOrderTableVO {
	private String orderCodeSeq;
	private Date orderDate;
	private String orderZipcode;
	private String orderAddressFirst;
	private String orderAddressSecond;
	private int orderPayPrice;
	private int orderPointPrice;
	private String couponCodeSeq;
	private String orderPhoneNum;
	private String orderReceiver;
	
	public String getOrderPhoneNum() {
		return orderPhoneNum;
	}
	public void setOrderPhoneNum(String orderPhoneNum) {
		this.orderPhoneNum = orderPhoneNum;
	}
	public String getOrderReceiver() {
		return orderReceiver;
	}
	public void setOrderReceiver(String orderReceiver) {
		this.orderReceiver = orderReceiver;
	}
	public String getOrderCodeSeq() {
		return orderCodeSeq;
	}
	public void setOrderCodeSeq(String orderCodeSeq) {
		this.orderCodeSeq = orderCodeSeq;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getOrderZipcode() {
		return orderZipcode;
	}
	public void setOrderZipcode(String orderZipcode) {
		this.orderZipcode = orderZipcode;
	}
	public String getOrderAddressFirst() {
		return orderAddressFirst;
	}
	public void setOrderAddressFirst(String orderAddressFirst) {
		this.orderAddressFirst = orderAddressFirst;
	}
	public String getOrderAddressSecond() {
		return orderAddressSecond;
	}
	public void setOrderAddressSecond(String orderAddressSecond) {
		this.orderAddressSecond = orderAddressSecond;
	}
	public int getOrderPayPrice() {
		return orderPayPrice;
	}
	public void setOrderPayPrice(int orderPayPrice) {
		this.orderPayPrice = orderPayPrice;
	}
	public int getOrderPointPrice() {
		return orderPointPrice;
	}
	public void setOrderPointPrice(int orderPointPrice) {
		this.orderPointPrice = orderPointPrice;
	}
	public String getCouponCodeSeq() {
		return couponCodeSeq;
	}
	public void setCouponCodeSeq(String couponCodeSeq) {
		this.couponCodeSeq = couponCodeSeq;
	}
	@Override
	public String toString() {
		return "UserOrderTableVO [orderCodeSeq=" + orderCodeSeq + ", orderDate=" + orderDate + ", orderZipcode="
				+ orderZipcode + ", orderAddressFirst=" + orderAddressFirst + ", orderAddressSecond="
				+ orderAddressSecond + ", orderPayPrice=" + orderPayPrice + ", orderPointPrice=" + orderPointPrice
				+ ", couponCodeSeq=" + couponCodeSeq + ", orderPhoneNum=" + orderPhoneNum + ", orderReceiver="
				+ orderReceiver + "]";
	}
	
	
	
	
}
