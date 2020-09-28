package com.web.bomulsum.user.productInfo.repository;

public class ReviewVO {
	private String memberImg;
	private String memberName;
	private int reviewStar;
	private String reviewDate;
	private String reviewContent;
	
	public String getMemberImg() {
		return memberImg;
	}
	public void setMemberImg(String memberImg) {
		this.memberImg = memberImg;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	
	public int getReviewStar() {
		return reviewStar;
	}
	public void setReviewStar(int reviewStar) {
		this.reviewStar = reviewStar;
	}
	public String getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	@Override
	public String toString() {
		return "ReviewVO [memberImg=" + memberImg + ", memberName=" + memberName + ", reviewStar=" + reviewStar
				+ ", reviewDate=" + reviewDate + ", reviewContent=" + reviewContent + "]";
	}
	
	
}
