package com.web.bomulsum.user.recently.repository;

public class UserRecentylWatchReviewVo {
	private int reviewStar;
	private String reviewComment;
	public int getReviewStar() {
		return reviewStar;
	}
	public void setReviewStar(int reviewStar) {
		this.reviewStar = reviewStar;
	}
	public String getReviewComment() {
		return reviewComment;
	}
	public void setReviewComment(String reviewComment) {
		this.reviewComment = reviewComment;
	}
	@Override
	public String toString() {
		return "UserRecentylWatchReviewVo [reviewStar=" + reviewStar + ", reviewComment=" + reviewComment + "]";
	}
	
}
