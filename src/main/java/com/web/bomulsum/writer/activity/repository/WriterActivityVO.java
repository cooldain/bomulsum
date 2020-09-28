package com.web.bomulsum.writer.activity.repository;

import java.sql.Date;

public class WriterActivityVO {
	
	//공통
	private String memberCodeSeq;
	private String artCodeSeq;
	private String writerSeq;
	private String memberName;
	private String artName;
	private String memberProfile;
	private String artPhoto;
	
	//리뷰 테이블
	private String reviewCodeSeq;
	private String buyArtCodeSeq;
	private String reviewComment;
	private String reviewStar;
	private String reviewPhoto;
	private Date reviewDate;
	private String reviewCommentRe;
	private Date reviewCommentReDate;
	private String reviewCommentReStatus;
	
	//알람 테이블
	private String alarmSeq;
	private String senderCode;
	private String recipientCode;
	private String alarmTitle;
	private Date alarmDate;
	private String alarmContent;
	private String alarmRead;
	
	//댓글 테이블
	private String commentSeq;
	private String commentContent;
	private String commentStatus;
	private Date commentDate;
	private String commentRecomment;
	private Date commentRecommentDate;
	public String getMemberCodeSeq() {
		return memberCodeSeq;
	}
	public void setMemberCodeSeq(String memberCodeSeq) {
		this.memberCodeSeq = memberCodeSeq;
	}
	public String getArtCodeSeq() {
		return artCodeSeq;
	}
	public void setArtCodeSeq(String artCodeSeq) {
		this.artCodeSeq = artCodeSeq;
	}
	public String getWriterSeq() {
		return writerSeq;
	}
	public void setWriterSeq(String writerSeq) {
		this.writerSeq = writerSeq;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getArtName() {
		return artName;
	}
	public void setArtName(String artName) {
		this.artName = artName;
	}
	public String getMemberProfile() {
		return memberProfile;
	}
	public void setMemberProfile(String memberProfile) {
		this.memberProfile = memberProfile;
	}
	public String getArtPhoto() {
		return artPhoto;
	}
	public void setArtPhoto(String artPhoto) {
		this.artPhoto = artPhoto;
	}
	public String getReviewCodeSeq() {
		return reviewCodeSeq;
	}
	public void setReviewCodeSeq(String reviewCodeSeq) {
		this.reviewCodeSeq = reviewCodeSeq;
	}
	public String getBuyArtCodeSeq() {
		return buyArtCodeSeq;
	}
	public void setBuyArtCodeSeq(String buyArtCodeSeq) {
		this.buyArtCodeSeq = buyArtCodeSeq;
	}
	public String getReviewComment() {
		return reviewComment;
	}
	public void setReviewComment(String reviewComment) {
		this.reviewComment = reviewComment;
	}
	public String getReviewStar() {
		return reviewStar;
	}
	public void setReviewStar(String reviewStar) {
		this.reviewStar = reviewStar;
	}
	public String getReviewPhoto() {
		return reviewPhoto;
	}
	public void setReviewPhoto(String reviewPhoto) {
		this.reviewPhoto = reviewPhoto;
	}
	public Date getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}
	public String getReviewCommentRe() {
		return reviewCommentRe;
	}
	public void setReviewCommentRe(String reviewCommentRe) {
		this.reviewCommentRe = reviewCommentRe;
	}
	public Date getReviewCommentReDate() {
		return reviewCommentReDate;
	}
	public void setReviewCommentReDate(Date reviewCommentReDate) {
		this.reviewCommentReDate = reviewCommentReDate;
	}
	public String getReviewCommentReStatus() {
		return reviewCommentReStatus;
	}
	public void setReviewCommentReStatus(String reviewCommentReStatus) {
		this.reviewCommentReStatus = reviewCommentReStatus;
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
	public Date getAlarmDate() {
		return alarmDate;
	}
	public void setAlarmDate(Date alarmDate) {
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
	public String getCommentSeq() {
		return commentSeq;
	}
	public void setCommentSeq(String commentSeq) {
		this.commentSeq = commentSeq;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public String getCommentStatus() {
		return commentStatus;
	}
	public void setCommentStatus(String commentStatus) {
		this.commentStatus = commentStatus;
	}
	public Date getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}
	public String getCommentRecomment() {
		return commentRecomment;
	}
	public void setCommentRecomment(String commentRecomment) {
		this.commentRecomment = commentRecomment;
	}
	public Date getCommentRecommentDate() {
		return commentRecommentDate;
	}
	public void setCommentRecommentDate(Date commentRecommentDate) {
		this.commentRecommentDate = commentRecommentDate;
	}
	@Override
	public String toString() {
		return "WriterActivityVO [memberCodeSeq=" + memberCodeSeq + ", artCodeSeq=" + artCodeSeq + ", writerSeq="
				+ writerSeq + ", memberName=" + memberName + ", artName=" + artName + ", memberProfile=" + memberProfile
				+ ", artPhoto=" + artPhoto + ", reviewCodeSeq=" + reviewCodeSeq + ", buyArtCodeSeq=" + buyArtCodeSeq
				+ ", reviewComment=" + reviewComment + ", reviewStar=" + reviewStar + ", reviewPhoto=" + reviewPhoto
				+ ", reviewDate=" + reviewDate + ", reviewCommentRe=" + reviewCommentRe + ", reviewCommentReDate="
				+ reviewCommentReDate + ", reviewCommentReStatus=" + reviewCommentReStatus + ", alarmSeq=" + alarmSeq
				+ ", senderCode=" + senderCode + ", recipientCode=" + recipientCode + ", alarmTitle=" + alarmTitle
				+ ", alarmDate=" + alarmDate + ", alarmContent=" + alarmContent + ", alarmRead=" + alarmRead
				+ ", commentSeq=" + commentSeq + ", commentContent=" + commentContent + ", commentStatus="
				+ commentStatus + ", commentDate=" + commentDate + ", commentRecomment=" + commentRecomment
				+ ", commentRecommentDate=" + commentRecommentDate + "]";
	}
	
	
}
