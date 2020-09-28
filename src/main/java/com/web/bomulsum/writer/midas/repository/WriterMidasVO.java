package com.web.bomulsum.writer.midas.repository;

import java.util.Date;

import com.web.bomulsum.common.PageVO;

public class WriterMidasVO extends PageVO{

	private String orderSeq;
	private String writerCodeSeq;
	private String orderImg;
	private String midasName;
	private int midasPrice;
	private int midasDiscount;
	private int maxNumber;
	private String startDate;
	private String endDate;
	private String day;
	private String startTime;
	private String endTime;
	private String about;
	private String balance;
	private String address1;
	private String address2;
	private String keyword;
	private String run;
	private String category;
	private Date regDate;
	
	public String getOrderSeq() {
		return orderSeq;
	}
	public void setOrderSeq(String orderSeq) {
		this.orderSeq = orderSeq;
	}
	public String getWriterCodeSeq() {
		return writerCodeSeq;
	}
	public void setWriterCodeSeq(String writerCodeSeq) {
		this.writerCodeSeq = writerCodeSeq;
	}
	public String getOrderImg() {
		return orderImg;
	}
	public void setOrderImg(String orderImg) {
		this.orderImg = orderImg;
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
	public int getMaxNumber() {
		return maxNumber;
	}
	public void setMaxNumber(int maxNumber) {
		this.maxNumber = maxNumber;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getAbout() {
		return about;
	}
	public void setAbout(String about) {
		this.about = about;
	}
	public String getBalance() {
		return balance;
	}
	public void setBalance(String balance) {
		this.balance = balance;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	
	
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getRun() {
		return run;
	}
	public void setRun(String run) {
		this.run = run;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "WriterMidasVO [orderSeq=" + orderSeq + ", writerCodeSeq=" + writerCodeSeq + ", orderImg=" + orderImg
				+ ", midasName=" + midasName + ", midasPrice=" + midasPrice + ", midasDiscount=" + midasDiscount
				+ ", maxNumber=" + maxNumber + ", startDate=" + startDate + ", endDate=" + endDate + ", day=" + day
				+ ", startTime=" + startTime + ", endTime=" + endTime + ", about=" + about + ", balance=" + balance
				+ ", address1=" + address1 + ", address2=" + address2 + ", keyword=" + keyword + ", run=" + run
				+ ", category=" + category + ", regDate=" + regDate + "]";
	}
	
	
	
	
	
}
