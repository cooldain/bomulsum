package com.web.bomulsum.user.orderList.repository;

import java.sql.Date;

public class UserBuyWriterVO {
	private String buyWriterCodeSeq;
	private String orderCodeSeq;
	private String writerCodeSeq;
	private String writerName;
	private String writerBrandName;
	private int buyWriterSendPrice;
	private int buyWriterPlusSendPrice;
	private String buyWriterOrderStatus;
	private String buyWriterOrderRefundReason;
	private Date buyWriterOrderRefundDate;
	private Date buyRefundRequestDate;
	private String buyDeliveryName;
	private String buyDeliveryNum;
	
	
	
	
	public String getBuyDeliveryName() {
		return buyDeliveryName;
	}
	public void setBuyDeliveryName(String buyDeliveryName) {
		this.buyDeliveryName = buyDeliveryName;
	}
	public String getBuyDeliveryNum() {
		return buyDeliveryNum;
	}
	public void setBuyDeliveryNum(String buyDeliveryNum) {
		this.buyDeliveryNum = buyDeliveryNum;
	}
	public Date getBuyRefundRequestDate() {
		return buyRefundRequestDate;
	}
	public void setBuyRefundRequestDate(Date buyRefundRequestDate) {
		this.buyRefundRequestDate = buyRefundRequestDate;
	}
	public Date getBuyWriterOrderRefundDate() {
		return buyWriterOrderRefundDate;
	}
	public void setBuyWriterOrderRefundDate(Date buyWriterOrderRefundDate) {
		this.buyWriterOrderRefundDate = buyWriterOrderRefundDate;
	}
	public String getBuyWriterCodeSeq() {
		return buyWriterCodeSeq;
	}
	public void setBuyWriterCodeSeq(String buyWriterCodeSeq) {
		this.buyWriterCodeSeq = buyWriterCodeSeq;
	}
	public String getOrderCodeSeq() {
		return orderCodeSeq;
	}
	public void setOrderCodeSeq(String orderCodeSeq) {
		this.orderCodeSeq = orderCodeSeq;
	}
	public String getWriterCodeSeq() {
		return writerCodeSeq;
	}
	public void setWriterCodeSeq(String writerCodeSeq) {
		this.writerCodeSeq = writerCodeSeq;
	}
	public String getWriterName() {
		return writerName;
	}
	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}
	public String getWriterBrandName() {
		return writerBrandName;
	}
	public void setWriterBrandName(String writerBrandName) {
		this.writerBrandName = writerBrandName;
	}
	public int getBuyWriterSendPrice() {
		return buyWriterSendPrice;
	}
	public void setBuyWriterSendPrice(int buyWriterSendPrice) {
		this.buyWriterSendPrice = buyWriterSendPrice;
	}
	public int getBuyWriterPlusSendPrice() {
		return buyWriterPlusSendPrice;
	}
	public void setBuyWriterPlusSendPrice(int buyWriterPlusSendPrice) {
		this.buyWriterPlusSendPrice = buyWriterPlusSendPrice;
	}
	public String getBuyWriterOrderStatus() {
		return buyWriterOrderStatus;
	}
	public void setBuyWriterOrderStatus(String buyWriterOrderStatus) {
		this.buyWriterOrderStatus = buyWriterOrderStatus;
	}
	public String getBuyWriterOrderRefundReason() {
		return buyWriterOrderRefundReason;
	}
	public void setBuyWriterOrderRefundReason(String buyWriterOrderRefundReason) {
		this.buyWriterOrderRefundReason = buyWriterOrderRefundReason;
	}
	@Override
	public String toString() {
		return "UserBuyWriterVO [buyWriterCodeSeq=" + buyWriterCodeSeq + ", orderCodeSeq=" + orderCodeSeq
				+ ", writerCodeSeq=" + writerCodeSeq + ", writerName=" + writerName + ", writerBrandName="
				+ writerBrandName + ", buyWriterSendPrice=" + buyWriterSendPrice + ", buyWriterPlusSendPrice="
				+ buyWriterPlusSendPrice + ", buyWriterOrderStatus=" + buyWriterOrderStatus
				+ ", buyWriterOrderRefundReason=" + buyWriterOrderRefundReason + ", buyWriterOrderRefundDate="
				+ buyWriterOrderRefundDate + ", buyRefundRequestDate=" + buyRefundRequestDate + ", buyDeliveryName="
				+ buyDeliveryName + ", buyDeliveryNum=" + buyDeliveryNum + "]";
	}
	
	
	
	
	
	
	
	
}
