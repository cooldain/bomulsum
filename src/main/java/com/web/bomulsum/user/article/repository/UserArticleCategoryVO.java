package com.web.bomulsum.user.article.repository;

import java.sql.Date;
import java.util.List;

public class UserArticleCategoryVO {
	private String artCode;
	private String writerCode;
	private String writerName;
	private String writerBrandName;
	private int writerSendPrice;
	private String artPhoto;
	private String artCategory;
	private String artName;
	private int artPrice;
	private int artDiscount;
	private int artViewcount;
	private String artKeyword;
	private Date artRegisterDate;
	private int totCnt;
	private int startNum;
	private List<Integer> articleReview;
	
	
	public List<Integer> getArticleReview() {
		return articleReview;
	}
	public void setArticleReview(List<Integer> articleReview) {
		this.articleReview = articleReview;
	}
	public Date getArtRegisterDate() {
		return artRegisterDate;
	}
	public void setArtRegisterDate(Date artRegisterDate) {
		this.artRegisterDate = artRegisterDate;
	}
	public int getTotCnt() {
		return totCnt;
	}
	public void setTotCnt(int totCnt) {
		this.totCnt = totCnt;
	}
	public int getStartNum() {
		return startNum;
	}
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	public int getWriterSendPrice() {
		return writerSendPrice;
	}
	public void setWriterSendPrice(int writerSendPrice) {
		this.writerSendPrice = writerSendPrice;
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
	public int getArtViewcount() {
		return artViewcount;
	}
	public void setArtViewcount(int artViewcount) {
		this.artViewcount = artViewcount;
	}
	public String getArtCode() {
		return artCode;
	}
	public void setArtCode(String artCode) {
		this.artCode = artCode;
	}
	public String getWriterCode() {
		return writerCode;
	}
	public void setWriterCode(String writerCode) {
		this.writerCode = writerCode;
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
	public String getArtPhoto() {
		return artPhoto;
	}
	public void setArtPhoto(String artPhoto) {
		this.artPhoto = artPhoto;
	}
	public String getArtCategory() {
		return artCategory;
	}
	public void setArtCategory(String artCategory) {
		this.artCategory = artCategory;
	}
	public String getArtName() {
		return artName;
	}
	public void setArtName(String artName) {
		this.artName = artName;
	}
	
	public String getArtKeyword() {
		return artKeyword;
	}
	public void setArtKeyword(String artKeyword) {
		this.artKeyword = artKeyword;
	}
	@Override
	public String toString() {
		return "UserArticleCategoryVO [artCode=" + artCode + ", writerCode=" + writerCode + ", writerName=" + writerName
				+ ", writerBrandName=" + writerBrandName + ", writerSendPrice=" + writerSendPrice + ", artPhoto="
				+ artPhoto + ", artCategory=" + artCategory + ", artName=" + artName + ", artPrice=" + artPrice
				+ ", artDiscount=" + artDiscount + ", artViewcount=" + artViewcount + ", artKeyword=" + artKeyword
				+ ", artRegisterDate=" + artRegisterDate + ", totCnt=" + totCnt + ", startNum=" + startNum
				+ ", articleReview=" + articleReview + "]";
	}


	

	
	
	
}