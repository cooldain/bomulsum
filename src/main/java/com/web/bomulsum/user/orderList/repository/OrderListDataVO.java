package com.web.bomulsum.user.orderList.repository;

import java.util.List;

public class OrderListDataVO {
	private UserOrderTableVO orderTable;
	private List<UserBuyWriterVO> buyWriter;
	private List<UserBuyArtVO> buyArt;
	private List<UserBuyOptionVO> buyOption;
	
	public List<UserBuyWriterVO> getBuyWriter() {
		return buyWriter;
	}
	public void setBuyWriter(List<UserBuyWriterVO> buyWriter) {
		this.buyWriter = buyWriter;
	}
	public List<UserBuyArtVO> getBuyArt() {
		return buyArt;
	}
	public void setBuyArt(List<UserBuyArtVO> buyArt) {
		this.buyArt = buyArt;
	}
	public List<UserBuyOptionVO> getBuyOption() {
		return buyOption;
	}
	public void setBuyOption(List<UserBuyOptionVO> buyOption) {
		this.buyOption = buyOption;
	}
	public UserOrderTableVO getOrderTable() {
		return orderTable;
	}
	public void setOrderTable(UserOrderTableVO orderTable) {
		this.orderTable = orderTable;
	}
	@Override
	public String toString() {
		return "OrderListDataVO [orderTable=" + orderTable + ", buyWriter=" + buyWriter + ", buyArt=" + buyArt
				+ ", buyOption=" + buyOption + "]";
	}
	
	
	
}
