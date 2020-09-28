package com.web.bomulsum.user.coupon.repository;

import java.sql.Date;

public class UserCouponListVO {
	private String couponName;
	private String couponPrice;
	private Date couponDate;
	public String getCouponName() {
		return couponName;
	}
	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}
	public String getCouponPrice() {
		return couponPrice;
	}
	public void setCouponPrice(String couponPrice) {
		this.couponPrice = couponPrice;
	}
	public Date getCouponDate() {
		return couponDate;
	}
	public void setCouponDate(Date couponDate) {
		this.couponDate = couponDate;
	}
	@Override
	public String toString() {
		return "UserCouponVO [couponName=" + couponName + ", couponPrice=" + couponPrice + ", couponDate=" + couponDate
				+ "]";
	}
	
}
