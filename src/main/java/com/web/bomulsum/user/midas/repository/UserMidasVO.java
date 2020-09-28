package com.web.bomulsum.user.midas.repository;

import java.sql.Date;

public class UserMidasVO {
	private String midasCodeSeq;
	private String writerCodeSeq;
	private String midasImg;
	private String midasName;
	private int midasPrice;
	private int midasDiscount;
	private int midasMax;
	private Date midasStartDate;
	private Date midasEndDate;
	private String midasDay;
	private String midasAbout;
	private String midasCategory;
	private String midasBalance;
	private String midasAddress1;
	private String midasAddress2;
	private String midasKeyword;
	private String midasRun;
	
	
	
	public String getMidasCodeSeq() {
		return midasCodeSeq;
	}
	public void setMidasCodeSeq(String midasCodeSeq) {
		this.midasCodeSeq = midasCodeSeq;
	}
	public String getWriterCodeSeq() {
		return writerCodeSeq;
	}
	public void setWriterCodeSeq(String writerCodeSeq) {
		this.writerCodeSeq = writerCodeSeq;
	}
	public String getMidasImg() {
		return midasImg;
	}
	public void setMidasImg(String midasImg) {
		this.midasImg = midasImg;
	}
	public String getMidasName() {
		return midasName;
	}
	public void setMidasName(String midasName) {
		this.midasName = midasName;
	}
	public int getMidasPrice() {
		return midasPrice;
	}
	public void setMidasPrice(int midasPrice) {
		this.midasPrice = midasPrice;
	}
	public int getMidasDiscount() {
		return midasDiscount;
	}
	public void setMidasDiscount(int midasDiscount) {
		this.midasDiscount = midasDiscount;
	}
	public int getMidasMax() {
		return midasMax;
	}
	public void setMidasMax(int midasMax) {
		this.midasMax = midasMax;
	}
	public Date getMidasStartDate() {
		return midasStartDate;
	}
	public void setMidasStartDate(Date midasStartDate) {
		this.midasStartDate = midasStartDate;
	}
	public Date getMidasEndDate() {
		return midasEndDate;
	}
	public void setMidasEndDate(Date midasEndDate) {
		this.midasEndDate = midasEndDate;
	}

	public String getMidasDay() {
		return midasDay;
	}
	public void setMidasDay(String midasDay) {
		this.midasDay = midasDay;
	}
	public String getMidasBalance() {
		return midasBalance;
	}
	public void setMidasBalance(String midasBalance) {
		this.midasBalance = midasBalance;
	}
	public String getMidasAbout() {
		return midasAbout;
	}
	public void setMidasAbout(String midasAbout) {
		this.midasAbout = midasAbout;
	}
	public String getMidasCategory() {
		return midasCategory;
	}
	public void setMidasCategory(String midasCategory) {
		this.midasCategory = midasCategory;
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
	public String getMidasKeyword() {
		return midasKeyword;
	}
	public void setMidasKeyword(String midasKeyword) {
		this.midasKeyword = midasKeyword;
	}
	public String getMidasRun() {
		return midasRun;
	}
	public void setMidasRun(String midasRun) {
		this.midasRun = midasRun;
	}
	@Override
	public String toString() {
		return "UserMidasVO [midasCodeSeq=" + midasCodeSeq + ", writerCodeSeq=" + writerCodeSeq + ", midasImg="
				+ midasImg + ", midasName=" + midasName + ", midasPrice=" + midasPrice + ", midasDiscount="
				+ midasDiscount + ", midasMax=" + midasMax + ", midasStartDate=" + midasStartDate + ", midasEndDate="
				+ midasEndDate + ", midasDay=" + midasDay + ", midasAbout=" + midasAbout + ", midasCategory="
				+ midasCategory + ", midasBalance=" + midasBalance + ", midasAddress1=" + midasAddress1
				+ ", midasAddress2=" + midasAddress2 + ", midasKeyword=" + midasKeyword + ", midasRun=" + midasRun
				+ "]";
	}
	
	
	
}
