package com.web.bomulsum.manager.statistics.repository;

public class MonthAverVO {
	private int price;
	private int amount;
	private String date;
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "MonthAverVO [price=" + price + ", amount=" + amount + ", date=" + date + "]";
	}
	
}
