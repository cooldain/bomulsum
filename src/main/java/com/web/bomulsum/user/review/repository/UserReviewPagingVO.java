package com.web.bomulsum.user.review.repository;

public class UserReviewPagingVO {
	private int nowPage;
	private int startNum;
	private int endNum;
	private String memberSeq;
	
	public String getMemberSeq() {
		return memberSeq;
	}
	public void setMemberSeq(String memberSeq) {
		this.memberSeq = memberSeq;
	}
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
	@Override
	public String toString() {
		return "UserReviewPagingVO [nowPage=" + nowPage + ", startNum=" + startNum + ", endNum=" + endNum
				+ ", memberSeq=" + memberSeq + "]";
	}
	
	
}
