package com.web.bomulsum.user.orderList.repository;

public class UserBuyArtVO {
	private String buyArtCodeSeq;
	private String orderCodeSeq;
	private String buyWriterCodeSeq;
	private String artCodeSeq;
	private String buyArtRequest;
	private String artName;
	private String buyArtReviewStatus;
	private String buyArtReviewUpdate;
	private String artPhoto;
	
	public String getBuyArtRequest() {
		return buyArtRequest;
	}
	public void setBuyArtRequest(String buyArtRequest) {
		this.buyArtRequest = buyArtRequest;
	}
	public String getArtName() {
		return artName;
	}
	public void setArtName(String artName) {
		this.artName = artName;
	}
	public String getArtPhoto() {
		return artPhoto;
	}
	public void setArtPhoto(String artPhoto) {
		this.artPhoto = artPhoto;
	}
	public String getBuyArtCodeSeq() {
		return buyArtCodeSeq;
	}
	public void setBuyArtCodeSeq(String buyArtCodeSeq) {
		this.buyArtCodeSeq = buyArtCodeSeq;
	}
	public String getOrderCodeSeq() {
		return orderCodeSeq;
	}
	public void setOrderCodeSeq(String orderCodeSeq) {
		this.orderCodeSeq = orderCodeSeq;
	}
	public String getBuyWriterCodeSeq() {
		return buyWriterCodeSeq;
	}
	public void setBuyWriterCodeSeq(String buyWriterCodeSeq) {
		this.buyWriterCodeSeq = buyWriterCodeSeq;
	}
	public String getArtCodeSeq() {
		return artCodeSeq;
	}
	public void setArtCodeSeq(String artCodeSeq) {
		this.artCodeSeq = artCodeSeq;
	}
	public String getBuyArtReviewStatus() {
		return buyArtReviewStatus;
	}
	public void setBuyArtReviewStatus(String buyArtReviewStatus) {
		this.buyArtReviewStatus = buyArtReviewStatus;
	}
	public String getBuyArtReviewUpdate() {
		return buyArtReviewUpdate;
	}
	public void setBuyArtReviewUpdate(String buyArtReviewUpdate) {
		this.buyArtReviewUpdate = buyArtReviewUpdate;
	}
	@Override
	public String toString() {
		return "UserBuyArtVO [buyArtCodeSeq=" + buyArtCodeSeq + ", orderCodeSeq=" + orderCodeSeq + ", buyWriterCodeSeq="
				+ buyWriterCodeSeq + ", artCodeSeq=" + artCodeSeq + ", buyArtRequest=" + buyArtRequest + ", artName="
				+ artName + ", buyArtReviewStatus=" + buyArtReviewStatus + ", buyArtReviewUpdate=" + buyArtReviewUpdate
				+ ", artPhoto=" + artPhoto + "]";
	}
	
	
	
}
