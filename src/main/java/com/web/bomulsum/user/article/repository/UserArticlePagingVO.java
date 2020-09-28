package com.web.bomulsum.user.article.repository;

import java.util.List;

public class UserArticlePagingVO {
	private int nowPage;
	private int startNum;
	private int endNum;
	private String category;
	private List<String> filtArr;
	private String sendPrice;
	private String orderBy;
	
	
	public String getOrderBy() {
		return orderBy;
	}
	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}
	public String getSendPrice() {
		return sendPrice;
	}
	public void setSendPrice(String sendPrice) {
		this.sendPrice = sendPrice;
	}
	public List<String> getFiltArr() {
		return filtArr;
	}
	public void setFiltArr(List<String> filtArr) {
		this.filtArr = filtArr;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getStartNum() {
		return startNum;
	}
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	public int getEndNum() {
		return endNum;
	}
	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}
	@Override
	public String toString() {
		return "UserArticlePagingVO [nowPage=" + nowPage + ", startNum=" + startNum + ", endNum=" + endNum
				+ ", category=" + category + ", filtArr=" + filtArr + ", sendPrice=" + sendPrice + ", orderBy="
				+ orderBy + "]";
	}
	
	
	
}