package com.web.bomulsum.user.controller;

public class UserHomeVO {
	private String artCode;
	private String writerName;
	private String artImg;
	private String artName;
	private int reviewCnt;
	private int reviewValue;
	public String getArtCode() {
		return artCode;
	}
	public void setArtCode(String artCode) {
		this.artCode = artCode;
	}
	public String getWriterName() {
		return writerName;
	}
	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}
	public String getArtImg() {
		return artImg;
	}
	public void setArtImg(String artImg) {
		this.artImg = artImg;
	}
	public String getArtName() {
		return artName;
	}
	public void setArtName(String artName) {
		this.artName = artName;
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
	@Override
	public String toString() {
		return "UserHomeVO [artCode=" + artCode + ", writerName=" + writerName + ", artImg=" + artImg + ", artName="
				+ artName + ", reviewCnt=" + reviewCnt + ", reviewValue=" + reviewValue + "]";
	}
	
	
}
