package com.web.bomulsum.user.review.repository;

import java.sql.Date;

public class UserReviewVO {

	//공통
	private String reviewCodeSeq;
	private String orderCodeSeq;
	private String memberCodeSeq;
	private String memberName;
	private String artCodeSeq;
	private String artName;
	
	//구매후기 쓸 때 - 구매후기 테이블
	private Date reviewDate;
	private String reviewComment;
	private String reviewStar;
	private String reviewPhoto;
	private String reviewCommentRe;
	private Date reviewCommentReDate;
	private String reviewCommentReStatus;
	
	//일단 보류
	private String writerBrandName;
	private String writerCodeSeq;
	private String memberProfile;
	private String artOptionSeq;
	private String artOptionCategory;
	private String artOptionName;
	private String artOptionPrice;
	private String artOptionCount;
	private String artPrice;
	private String artDiscount;
	private String artOptionAmount;
	private String artAmount;
	private String cartStatus;
	
	
	//구매후기 쓸 수 있는 구매 목록 불러올 때 - 구매 상품 테이블
	private String buyArtCodeSeq;
	private String bArtCodeSeq;
	private String bArtName;
	private String bWriterCodeSeq;
	private String bArtOptionCategory;
	private String bArtOptionName;
	private int bArtOptionPrice;
	private int bArtOptionCount;
	private String bArtReviewStatus;
	private String bArtReviewUpdate;
	
	private String artPhoto;
	private String artDescription;
	private String writerName;
	private Date orderDate;
	
	private String alarmContent;

	private String gRnum;
	private String dateNum;
	
	private String bOrderCodeSeq;
	private String writerUrl;
	private String writerProfileImg;

	
	public String getWriterProfileImg() {
		return writerProfileImg;
	}
	public void setWriterProfileImg(String writerProfileImg) {
		this.writerProfileImg = writerProfileImg;
	}
	public String getWriterUrl() {
		return writerUrl;
	}
	public void setWriterUrl(String writerUrl) {
		this.writerUrl = writerUrl;
	}
	public String getbOrderCodeSeq() {
		return bOrderCodeSeq;
	}
	public void setbOrderCodeSeq(String bOrderCodeSeq) {
		this.bOrderCodeSeq = bOrderCodeSeq;
	}
	public String getReviewCodeSeq() {
		return reviewCodeSeq;
	}
	public void setReviewCodeSeq(String reviewCodeSeq) {
		this.reviewCodeSeq = reviewCodeSeq;
	}
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
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getArtCodeSeq() {
		return artCodeSeq;
	}
	public void setArtCodeSeq(String artCodeSeq) {
		this.artCodeSeq = artCodeSeq;
	}
	public String getArtName() {
		return artName;
	}
	public void setArtName(String artName) {
		this.artName = artName;
	}
	public Date getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}
	public String getReviewComment() {
		return reviewComment;
	}
	public void setReviewComment(String reviewComment) {
		this.reviewComment = reviewComment;
	}
	public String getReviewStar() {
		return reviewStar;
	}
	public void setReviewStar(String reviewStar) {
		this.reviewStar = reviewStar;
	}
	public String getReviewPhoto() {
		return reviewPhoto;
	}
	public void setReviewPhoto(String reviewPhoto) {
		this.reviewPhoto = reviewPhoto;
	}
	public String getReviewCommentRe() {
		return reviewCommentRe;
	}
	public void setReviewCommentRe(String reviewCommentRe) {
		this.reviewCommentRe = reviewCommentRe;
	}
	public Date getReviewCommentReDate() {
		return reviewCommentReDate;
	}
	public void setReviewCommentReDate(Date reviewCommentReDate) {
		this.reviewCommentReDate = reviewCommentReDate;
	}
	public String getReviewCommentReStatus() {
		return reviewCommentReStatus;
	}
	public void setReviewCommentReStatus(String reviewCommentReStatus) {
		this.reviewCommentReStatus = reviewCommentReStatus;
	}
	public String getWriterBrandName() {
		return writerBrandName;
	}
	public void setWriterBrandName(String writerBrandName) {
		this.writerBrandName = writerBrandName;
	}
	public String getWriterCodeSeq() {
		return writerCodeSeq;
	}
	public void setWriterCodeSeq(String writerCodeSeq) {
		this.writerCodeSeq = writerCodeSeq;
	}
	public String getMemberProfile() {
		return memberProfile;
	}
	public void setMemberProfile(String memberProfile) {
		this.memberProfile = memberProfile;
	}
	public String getArtOptionSeq() {
		return artOptionSeq;
	}
	public void setArtOptionSeq(String artOptionSeq) {
		this.artOptionSeq = artOptionSeq;
	}
	public String getArtOptionCategory() {
		return artOptionCategory;
	}
	public void setArtOptionCategory(String artOptionCategory) {
		this.artOptionCategory = artOptionCategory;
	}
	public String getArtOptionName() {
		return artOptionName;
	}
	public void setArtOptionName(String artOptionName) {
		this.artOptionName = artOptionName;
	}
	public String getArtOptionPrice() {
		return artOptionPrice;
	}
	public void setArtOptionPrice(String artOptionPrice) {
		this.artOptionPrice = artOptionPrice;
	}
	public String getArtOptionCount() {
		return artOptionCount;
	}
	public void setArtOptionCount(String artOptionCount) {
		this.artOptionCount = artOptionCount;
	}
	public String getArtPrice() {
		return artPrice;
	}
	public void setArtPrice(String artPrice) {
		this.artPrice = artPrice;
	}
	public String getArtDiscount() {
		return artDiscount;
	}
	public void setArtDiscount(String artDiscount) {
		this.artDiscount = artDiscount;
	}

	public String getArtOptionAmount() {
		return artOptionAmount;
	}
	public void setArtOptionAmount(String artOptionAmount) {
		this.artOptionAmount = artOptionAmount;
	}
	public String getArtAmount() {
		return artAmount;
	}
	public void setArtAmount(String artAmount) {
		this.artAmount = artAmount;
	}
	public String getCartStatus() {
		return cartStatus;
	}
	public void setCartStatus(String cartStatus) {
		this.cartStatus = cartStatus;
	}
	public String getBuyArtCodeSeq() {
		return buyArtCodeSeq;
	}
	public void setBuyArtCodeSeq(String buyArtCodeSeq) {
		this.buyArtCodeSeq = buyArtCodeSeq;
	}
	public String getbArtCodeSeq() {
		return bArtCodeSeq;
	}
	public void setbArtCodeSeq(String bArtCodeSeq) {
		this.bArtCodeSeq = bArtCodeSeq;
	}
	public String getbArtName() {
		return bArtName;
	}
	public void setbArtName(String bArtName) {
		this.bArtName = bArtName;
	}
	public String getbWriterCodeSeq() {
		return bWriterCodeSeq;
	}
	public void setbWriterCodeSeq(String bWriterCodeSeq) {
		this.bWriterCodeSeq = bWriterCodeSeq;
	}
	public String getbArtOptionCategory() {
		return bArtOptionCategory;
	}
	public void setbArtOptionCategory(String bArtOptionCategory) {
		this.bArtOptionCategory = bArtOptionCategory;
	}
	public String getbArtOptionName() {
		return bArtOptionName;
	}
	public void setbArtOptionName(String bArtOptionName) {
		this.bArtOptionName = bArtOptionName;
	}
	public int getbArtOptionPrice() {
		return bArtOptionPrice;
	}
	public void setbArtOptionPrice(int bArtOptionPrice) {
		this.bArtOptionPrice = bArtOptionPrice;
	}
	public int getbArtOptionCount() {
		return bArtOptionCount;
	}
	public void setbArtOptionCount(int bArtOptionCount) {
		this.bArtOptionCount = bArtOptionCount;
	}
	public String getbArtReviewStatus() {
		return bArtReviewStatus;
	}
	public void setbArtReviewStatus(String bArtReviewStatus) {
		this.bArtReviewStatus = bArtReviewStatus;
	}
	public String getbArtReviewUpdate() {
		return bArtReviewUpdate;
	}
	public void setbArtReviewUpdate(String bArtReviewUpdate) {
		this.bArtReviewUpdate = bArtReviewUpdate;
	}
	public String getArtPhoto() {
		return artPhoto;
	}
	public void setArtPhoto(String artPhoto) {
		this.artPhoto = artPhoto;
	}
	public String getArtDescription() {
		return artDescription;
	}
	public void setArtDescription(String artDescription) {
		this.artDescription = artDescription;
	}
	public String getWriterName() {
		return writerName;
	}
	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getAlarmContent() {
		return alarmContent;
	}
	public void setAlarmContent(String alarmContent) {
		this.alarmContent = alarmContent;
	}
	public String getgRnum() {
		return gRnum;
	}
	public void setgRnum(String gRnum) {
		this.gRnum = gRnum;
	}
	public String getDateNum() {
		return dateNum;
	}
	public void setDateNum(String dateNum) {
		this.dateNum = dateNum;
	}
	@Override
	public String toString() {
		return "UserReviewVO [reviewCodeSeq=" + reviewCodeSeq + ", orderCodeSeq=" + orderCodeSeq + ", memberCodeSeq="
				+ memberCodeSeq + ", memberName=" + memberName + ", artCodeSeq=" + artCodeSeq + ", artName=" + artName
				+ ", reviewDate=" + reviewDate + ", reviewComment=" + reviewComment + ", reviewStar=" + reviewStar
				+ ", reviewPhoto=" + reviewPhoto + ", reviewCommentRe=" + reviewCommentRe + ", reviewCommentReDate="
				+ reviewCommentReDate + ", reviewCommentReStatus=" + reviewCommentReStatus + ", writerBrandName="
				+ writerBrandName + ", writerCodeSeq=" + writerCodeSeq + ", memberProfile=" + memberProfile
				+ ", artOptionSeq=" + artOptionSeq + ", artOptionCategory=" + artOptionCategory + ", artOptionName="
				+ artOptionName + ", artOptionPrice=" + artOptionPrice + ", artOptionCount=" + artOptionCount
				+ ", artPrice=" + artPrice + ", artDiscount=" + artDiscount + ", artOptionAmount=" + artOptionAmount
				+ ", artAmount=" + artAmount + ", cartStatus=" + cartStatus + ", buyArtCodeSeq=" + buyArtCodeSeq
				+ ", bArtCodeSeq=" + bArtCodeSeq + ", bArtName=" + bArtName + ", bWriterCodeSeq=" + bWriterCodeSeq
				+ ", bArtOptionCategory=" + bArtOptionCategory + ", bArtOptionName=" + bArtOptionName
				+ ", bArtOptionPrice=" + bArtOptionPrice + ", bArtOptionCount=" + bArtOptionCount
				+ ", bArtReviewStatus=" + bArtReviewStatus + ", bArtReviewUpdate=" + bArtReviewUpdate + ", artPhoto="
				+ artPhoto + ", artDescription=" + artDescription + ", writerName=" + writerName + ", orderDate="
				+ orderDate + ", alarmContent=" + alarmContent + ", gRnum=" + gRnum + ", dateNum=" + dateNum + "]";
	}
	
}
