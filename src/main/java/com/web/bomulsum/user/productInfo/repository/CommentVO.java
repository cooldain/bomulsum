package com.web.bomulsum.user.productInfo.repository;

import java.sql.Date;

public class CommentVO {

	private String commentSeq;
	private String memberCodeSeq;
	private String artCodeSeq;
	private String commentContent;
	private String commentStatus;
	private Date commentDate;
	private String commentRecomment;
	private Date commentRecommentDate;
	private String writerCodeSeq;
	private String memberProfile; 
	private String memberName;

	
	public String getMemberProfile() {
		return memberProfile;
	}
	public void setMemberProfile(String memberProfile) {
		this.memberProfile = memberProfile;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getCommentSeq() {
		return commentSeq;
	}
	public void setCommentSeq(String commentSeq) {
		this.commentSeq = commentSeq;
	}
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
	public String getWriterCodeSeq() {
		return writerCodeSeq;
	}
	public void setWriterCodeSeq(String writerCodeSeq) {
		this.writerCodeSeq = writerCodeSeq;
	}
	@Override
	public String toString() {
		return "CommentVO [commentSeq=" + commentSeq + ", memberCodeSeq=" + memberCodeSeq + ", artCodeSeq=" + artCodeSeq
				+ ", commentContent=" + commentContent + ", commentStatus=" + commentStatus + ", commentDate="
				+ commentDate + ", commentRecomment=" + commentRecomment + ", commentRecommentDate="
				+ commentRecommentDate + ", writerCodeSeq=" + writerCodeSeq + ", memberProfile=" + memberProfile
				+ ", memberName=" + memberName + "]";
	}
	
	
	
	
	
}