package com.web.bomulsum.writer.art.repository;

import java.sql.Date;


public class WriterArtVO {
	
	private String artCodeSeq;
	private String writerCodeSeq;
	private String artPhoto;
	private String artName;
	private int artPrice;
	private int artDiscount;
	private int artAmount;
	private String artDescription;
	private String artCategory;
	private String artKeyword;
	private int artViewCount;
	private int artPoint;
	private int artSaleCount;
	private String artSaleState;
	private Date artRecommendTime;
	private Date artRegisterDate;
	private int bookMarkCount;
	private int commentCount;
	private int reviewCount;
	private String temp;
	

	
	

	@Override
	public String toString() {
		return "WriterArtVO [artCodeSeq=" + artCodeSeq + ", writerCodeSeq=" + writerCodeSeq + ", artPhoto=" + artPhoto
				+ ", artName=" + artName + ", artPrice=" + artPrice + ", artDiscount=" + artDiscount + ", artAmount="
				+ artAmount + ", artDescription=" + artDescription + ", artCategory=" + artCategory + ", artKeyword="
				+ artKeyword + ", artViewCount=" + artViewCount + ", artPoint=" + artPoint + ", artSaleCount="
				+ artSaleCount + ", artSaleState=" + artSaleState + ", artRecommendTime=" + artRecommendTime
				+ ", artRegisterDate=" + artRegisterDate + ", bookMarkCount=" + bookMarkCount + ", commentCount="
				+ commentCount + ", reviewCount=" + reviewCount + ", temp=" + temp + "]";
	}


	public String getTemp() {
		return temp;
	}


	public void setTemp(String temp) {
		this.temp = temp;
	}


	public String getArtCodeSeq() {
		return artCodeSeq;
	}

	public void setArtCodeSeq(String artCodeSeq) {
		this.artCodeSeq = artCodeSeq;
	}

	public String getWriterCodeSeq() {
		return writerCodeSeq;
	}

	public void setWriterCodeSeq(String writerCodeSeq) {
		this.writerCodeSeq = writerCodeSeq;
	}

	public String getArtPhoto() {
		return artPhoto;
	}

	public void setArtPhoto(String artPhoto) {
		this.artPhoto = artPhoto;
	}

	public String getArtName() {
		return artName;
	}

	public void setArtName(String artName) {
		this.artName = artName;
	}

	public int getArtPrice() {
		return artPrice;
	}

	public void setArtPrice(int artPrice) {
		this.artPrice = artPrice;
	}

	public int getArtDiscount() {
		return artDiscount;
	}

	public void setArtDiscount(int artDiscount) {
		this.artDiscount = artDiscount;
	}

	public int getArtAmount() {
		return artAmount;
	}

	public void setArtAmount(int artAmount) {
		this.artAmount = artAmount;
	}

	public String getArtDescription() {
		return artDescription;
	}

	public void setArtDescription(String artDescription) {
		this.artDescription = artDescription;
	}

	public String getArtCategory() {
		return artCategory;
	}

	public void setArtCategory(String artCategory) {
		this.artCategory = artCategory;
	}

	public String getArtKeyword() {
		return artKeyword;
	}

	public void setArtKeyword(String artKeyword) {
		this.artKeyword = artKeyword;
	}

	public int getArtViewCount() {
		return artViewCount;
	}

	public void setArtViewCount(int artViewCount) {
		this.artViewCount = artViewCount;
	}

	public int getArtPoint() {
		return artPoint;
	}

	public void setArtPoint(int artPoint) {
		this.artPoint = artPoint;
	}

	public int getArtSaleCount() {
		return artSaleCount;
	}

	public void setArtSaleCount(int artSaleCount) {
		this.artSaleCount = artSaleCount;
	}

	public String getArtSaleState() {
		return artSaleState;
	}

	public void setArtSaleState(String artSaleState) {
		this.artSaleState = artSaleState;
	}

	public Date getArtRecommendTime() {
		return artRecommendTime;
	}

	public void setArtRecommendTime(Date artRecommendTime) {
		this.artRecommendTime = artRecommendTime;
	}

	public Date getArtRegisterDate() {
		return artRegisterDate;
	}

	public void setArtRegisterDate(Date artRegisterDate) {
		this.artRegisterDate = artRegisterDate;
	}

	public int getBookMarkCount() {
		return bookMarkCount;
	}

	public void setBookMarkCount(int bookMarkCount) {
		this.bookMarkCount = bookMarkCount;
	}

	public int getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}

	public int getReviewCount() {
		return reviewCount;
	}

	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}
	

}
