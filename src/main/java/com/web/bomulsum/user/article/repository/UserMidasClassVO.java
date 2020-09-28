package com.web.bomulsum.user.article.repository;

import java.util.List;

public class UserMidasClassVO {
	
	private String midasCodeSeq;
	private String midasKeyword;
	private String midasAddress1;
	private String midasAddress2;
	private String midasCategory;
	private String midasName;
	private String midasImg;
	private List<Integer> midasReview;
	
	
	public List<Integer> getMidasReview() {
		return midasReview;
	}
	public void setMidasReview(List<Integer> midasReview) {
		this.midasReview = midasReview;
	}
	public String getMidasCodeSeq() {
		return midasCodeSeq;
	}
	public void setMidasCodeSeq(String midasCodeSeq) {
		this.midasCodeSeq = midasCodeSeq;
	}
	
	public String getMidasKeyword() {
		return midasKeyword;
	}
	public void setMidasKeyword(String midasKeyword) {
		this.midasKeyword = midasKeyword;
	}
	public String getMidasAddress1() {
		return midasAddress1;
	}
	public void setMidasAddress1(String midasAddress1) {
		this.midasAddress1 = midasAddress1;
	}
	public String getMidasAddress2() {
		return midasAddress2;
	}
	public void setMidasAddress2(String midasAddress2) {
		this.midasAddress2 = midasAddress2;
	}
	public String getMidasCategory() {
		return midasCategory;
	}
	public void setMidasCategory(String midasCategory) {
		this.midasCategory = midasCategory;
	}
	public String getMidasName() {
		return midasName;
	}
	public void setMidasName(String midasName) {
		this.midasName = midasName;
	}
	public String getMidasImg() {
		return midasImg;
	}
	public void setMidasImg(String midasImg) {
		this.midasImg = midasImg;
	}
	@Override
	public String toString() {
		return "UserMidasClassVO [midasCodeSeq=" + midasCodeSeq + ", midasKeyword=" + midasKeyword + ", midasAddress1="
				+ midasAddress1 + ", midasAddress2=" + midasAddress2 + ", midasCategory=" + midasCategory
				+ ", midasName=" + midasName + ", midasImg=" + midasImg + ", midasReview=" + midasReview + "]";
	}
	
	
	
}
