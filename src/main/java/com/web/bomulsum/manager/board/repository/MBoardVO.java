package com.web.bomulsum.manager.board.repository;

import java.sql.Date;

public class MBoardVO {

//	private String admin_notice_seq;
//	private Date admin_notice_date;
	//얘네 둘은 받아서 넘겨주는게 아니고, DB에 자동으로 입력되니까 없어도 됨. 이라고 생각했던것도 잠시였네욧.

	
	private String adminNoticeSeq;
	private String adminNoticeCategory;
	private String adminNoticeTitle;
	private String adminNoticeContent;
	private String adminNoticeCoupon;
	private Date adminNoticeDate;
	private String alarmTitle;
	private String alarmContent;
	private String alarmUser;
	
	public String getAdminNoticeSeq() {
		return adminNoticeSeq;
	}
	public void setAdminNoticeSeq(String adminNoticeSeq) {
		this.adminNoticeSeq = adminNoticeSeq;
	}
	public String getAdminNoticeCategory() {
		return adminNoticeCategory;
	}
	public void setAdminNoticeCategory(String adminNoticeCategory) {
		this.adminNoticeCategory = adminNoticeCategory;
	}
	public String getAdminNoticeTitle() {
		return adminNoticeTitle;
	}
	public void setAdminNoticeTitle(String adminNoticeTitle) {
		this.adminNoticeTitle = adminNoticeTitle;
	}
	public String getAdminNoticeContent() {
		return adminNoticeContent;
	}
	public void setAdminNoticeContent(String adminNoticeContent) {
		this.adminNoticeContent = adminNoticeContent;
	}
	public String getAdminNoticeCoupon() {
		return adminNoticeCoupon;
	}
	public void setAdminNoticeCoupon(String adminNoticeCoupon) {
		this.adminNoticeCoupon = adminNoticeCoupon;
	}
	public Date getAdminNoticeDate() {
		return adminNoticeDate;
	}
	public void setAdminNoticeDate(Date adminNoticeDate) {
		this.adminNoticeDate = adminNoticeDate;
	}
	public String getAlarmTitle() {
		return alarmTitle;
	}
	public void setAlarmTitle(String alarmTitle) {
		this.alarmTitle = alarmTitle;
	}
	public String getAlarmContent() {
		return alarmContent;
	}
	public void setAlarmContent(String alarmContent) {
		this.alarmContent = alarmContent;
	}
	
	public String getAlarmUser() {
		return alarmUser;
	}
	public void setAlarmUser(String alarmUser) {
		this.alarmUser = alarmUser;
	}
	@Override
	public String toString() {
		return "MBoardVO [adminNoticeSeq=" + adminNoticeSeq + ", adminNoticeCategory=" + adminNoticeCategory
				+ ", adminNoticeTitle=" + adminNoticeTitle + ", adminNoticeContent=" + adminNoticeContent
				+ ", adminNoticeCoupon=" + adminNoticeCoupon + ", adminNoticeDate=" + adminNoticeDate + ", alarmTitle="
				+ alarmTitle + ", alarmContent=" + alarmContent + ", alarmUser=" + alarmUser + "]";
	}
	
}
