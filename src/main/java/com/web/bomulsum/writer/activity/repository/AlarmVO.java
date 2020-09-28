package com.web.bomulsum.writer.activity.repository;

public class AlarmVO {

	private String alarmSeq;
	private String senderCode;
	private String recipientCode;
	private String alarmTitle;
	private String alarmDate;
	private String alarmContent;
	private String alarmRead;
	private String writerSeq;
	private String memberName;
	private String memberProfile;
	
	public String getWriterSeq() {
		return writerSeq;
	}
	public void setWriterSeq(String writerSeq) {
		this.writerSeq = writerSeq;
	}
	public String getAlarmSeq() {
		return alarmSeq;
	}
	public void setAlarmSeq(String alarmSeq) {
		this.alarmSeq = alarmSeq;
	}
	public String getSenderCode() {
		return senderCode;
	}
	public void setSenderCode(String senderCode) {
		this.senderCode = senderCode;
	}
	public String getRecipientCode() {
		return recipientCode;
	}
	public void setRecipientCode(String recipientCode) {
		this.recipientCode = recipientCode;
	}
	public String getAlarmTitle() {
		return alarmTitle;
	}
	public void setAlarmTitle(String alarmTitle) {
		this.alarmTitle = alarmTitle;
	}
	public String getAlarmDate() {
		return alarmDate;
	}
	public void setAlarmDate(String alarmDate) {
		this.alarmDate = alarmDate;
	}
	public String getAlarmContent() {
		return alarmContent;
	}
	public void setAlarmContent(String alarmContent) {
		this.alarmContent = alarmContent;
	}
	public String getAlarmRead() {
		return alarmRead;
	}
	public void setAlarmRead(String alarmRead) {
		this.alarmRead = alarmRead;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberProfile() {
		return memberProfile;
	}
	public void setMemberProfile(String memberProfile) {
		this.memberProfile = memberProfile;
	}
	@Override
	public String toString() {
		return "AlarmVO [alarmSeq=" + alarmSeq + ", senderCode=" + senderCode + ", recipientCode=" + recipientCode
				+ ", alarmTitle=" + alarmTitle + ", alarmDate=" + alarmDate + ", alarmContent=" + alarmContent
				+ ", alarmRead=" + alarmRead + ", writerSeq=" + writerSeq + ", memberName=" + memberName
				+ ", memberProfile=" + memberProfile + "]";
	}
	
	
	
}
