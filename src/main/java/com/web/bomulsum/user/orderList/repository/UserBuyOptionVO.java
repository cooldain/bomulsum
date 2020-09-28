package com.web.bomulsum.user.orderList.repository;

public class UserBuyOptionVO {
	private String buyOptionCodeSeq;
	private String orderCodeSeq;
	private String buyArtCodeSeq;
	
	private int artPrice;
	private String artOptionSeqList;
	private String artOptionName;
	private int artOptionAmount;
	public String getBuyOptionCodeSeq() {
		return buyOptionCodeSeq;
	}
	public void setBuyOptionCodeSeq(String buyOptionCodeSeq) {
		this.buyOptionCodeSeq = buyOptionCodeSeq;
	}
	public String getOrderCodeSeq() {
		return orderCodeSeq;
	}
	public void setOrderCodeSeq(String orderCodeSeq) {
		this.orderCodeSeq = orderCodeSeq;
	}
	public String getBuyArtCodeSeq() {
		return buyArtCodeSeq;
	}
	public void setBuyArtCodeSeq(String buyArtCodeSeq) {
		this.buyArtCodeSeq = buyArtCodeSeq;
	}
	public int getArtPrice() {
		return artPrice;
	}
	public void setArtPrice(int artPrice) {
		this.artPrice = artPrice;
	}
	public String getArtOptionSeqList() {
		return artOptionSeqList;
	}
	public void setArtOptionSeqList(String artOptionSeqList) {
		this.artOptionSeqList = artOptionSeqList;
	}
	public String getArtOptionName() {
		return artOptionName;
	}
	public void setArtOptionName(String artOptionName) {
		this.artOptionName = artOptionName;
	}
	public int getArtOptionAmount() {
		return artOptionAmount;
	}
	public void setArtOptionAmount(int artOptionAmount) {
		this.artOptionAmount = artOptionAmount;
	}
	@Override
	public String toString() {
		return "UserBuyOptionVO [buyOptionCodeSeq=" + buyOptionCodeSeq + ", orderCodeSeq=" + orderCodeSeq
				+ ", buyArtCodeSeq=" + buyArtCodeSeq + ", artPrice=" + artPrice + ", artOptionSeqList="
				+ artOptionSeqList + ", artOptionName=" + artOptionName + ", artOptionAmount=" + artOptionAmount + "]";
	}
	
	
}
