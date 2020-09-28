package com.web.bomulsum.user.profile.repository;

import java.sql.Date;

public class UserProfileOrderVO {
	private String orderCodeSeq;
	private String memberCodeSeq;
	private Date orderDate;
	private String artCodeSeq;
	private String orderPayPrice;
	private String orderStatus;
	
	public String getOrderCodeSeq() {
		return orderCodeSeq;
	}
	public void setOrderCodeSeq(String orderCodeSeq) {
		this.orderCodeSeq = orderCodeSeq;
	}
	public String getMemberCodeSeq() {
		return memberCodeSeq;
	}
	public void setMemberCodeSeq(String memberCodeSeq) {
		this.memberCodeSeq = memberCodeSeq;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getArtCodeSeq() {
		return artCodeSeq;
	}
	public void setArtCodeSeq(String artCodeSeq) {
		this.artCodeSeq = artCodeSeq;
	}
	public String getOrderPayPrice() {
		return orderPayPrice;
	}
	public void setOrderPayPrice(String orderPayPrice) {
		this.orderPayPrice = orderPayPrice;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	@Override
	public String toString() {
		return "UserProfileOrderVO [orderCodeSeq=" + orderCodeSeq + ", memberCodeSeq=" + memberCodeSeq + ", orderDate="
				+ orderDate + ", artCodeSeq=" + artCodeSeq + ", orderPayPrice=" + orderPayPrice + ", orderStatus="
				+ orderStatus + "]";
	}
	
}
