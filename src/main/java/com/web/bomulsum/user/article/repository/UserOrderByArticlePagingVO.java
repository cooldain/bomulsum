package com.web.bomulsum.user.article.repository;

public class UserOrderByArticlePagingVO {
	private int nowPage;
	private int startNum;
	private int endNum;
	private String orderBy;
	
	
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
	public String getOrderBy() {
		return orderBy;
	}
	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}
	@Override
	public String toString() {
		return "UserBestArticlePagingVO [nowPage=" + nowPage + ", startNum=" + startNum + ", endNum=" + endNum
				+ ", orderBy=" + orderBy + "]";
	}
	
	
	
}
