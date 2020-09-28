package com.web.bomulsum.user.recently.repository;

public class UserRecentylWatchVo {
	private String artCode;
	private String artImg;
	private String writerName;
	private String writerBrandName;
	private String artName;
	private int artPrice;
	private int artDiscount;
	private int artPercent;
	private int reviewCnt;
	private int reviewValue;
	private String recentlyReviewContent;
	
	
	
	public int getArtPercent() {
		return artPercent;
	}
	public void setArtPercent(int artPercent) {
		this.artPercent = artPercent;
	}
	public int getReviewCnt() {
		return reviewCnt;
	}
	public void setReviewCnt(int reviewCnt) {
		this.reviewCnt = reviewCnt;
	}
	public int getReviewValue() {
		return reviewValue;
	}
	public void setReviewValue(int reviewValue) {
		this.reviewValue = reviewValue;
	}
	public String getRecentlyReviewContent() {
		return recentlyReviewContent;
	}
	public void setRecentlyReviewContent(String recentlyReviewContent) {
		this.recentlyReviewContent = recentlyReviewContent;
	}
	public String getArtCode() {
		return artCode;
	}
	public void setArtCode(String artCode) {
		this.artCode = artCode;
	}
	public String getArtImg() {
		return artImg;
	}
	public void setArtImg(String artImg) {
		this.artImg = artImg;
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
	@Override
	public String toString() {
		return "UserRecentylWatchVo [artCode=" + artCode + ", artImg=" + artImg + ", writerName=" + writerName
				+ ", writerBrandName=" + writerBrandName + ", artName=" + artName + ", artPrice=" + artPrice
				+ ", artDiscount=" + artDiscount + ", artPercent=" + artPercent + ", reviewCnt=" + reviewCnt
				+ ", reviewValue=" + reviewValue + ", recentlyReviewContent=" + recentlyReviewContent + "]";
	}
	

	
	
	
	
	
}
